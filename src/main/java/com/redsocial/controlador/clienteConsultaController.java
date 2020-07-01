package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.cliente;
import com.redsocial.servicio.clienteServicio;

@Controller
public class clienteConsultaController {

	@Autowired
	private clienteServicio servicio;
	
	@RequestMapping("/verConsultacliente")
	public String ver() {
		return "consultacliente";
	}
	
	@RequestMapping("/consultacliente")
	public String lista(int idcategoria, String nombre, Model m) {
		List<cliente> lista =  servicio.listacliente(idcategoria, nombre+"%");
		m.addAttribute("cliente", lista);
		return "consultacliente";
	}
}
