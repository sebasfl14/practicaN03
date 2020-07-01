package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.categoria;
import com.redsocial.entidad.cliente;
import com.redsocial.servicio.categoriaServicio;
import com.redsocial.servicio.clienteServicio;

@Controller
public class clienteController {

	@Autowired
	private clienteServicio clienteServicio;
	
	@Autowired
	private categoriaServicio categoriaServicio;

	@RequestMapping("/vercliente")
	public String ver() {
		return "registracliente";
	}
	
	@RequestMapping("/cargacategoria")
	@ResponseBody
	public List<categoria> listacategoria() {
		return categoriaServicio.listacategoria();
	}
	
	@RequestMapping("/registracliente")
	public String metRegistra(cliente obj,HttpSession session) {
		cliente aux = clienteServicio.insertaActualizacliente(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:vercliente";
	}
}
