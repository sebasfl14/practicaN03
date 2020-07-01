package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.cliente;
import com.redsocial.servicio.clienteServicio;

@Controller
public class clienteCrudController {

	@Autowired
	private clienteServicio servicio;
	
	@RequestMapping("/verCrudcliente")
	public String ver() {
		return "crudcliente";
	}
	
	@RequestMapping("/consultaCrudcliente")
	public String lista(String filtro, Model m) {
		List<cliente> lista =  servicio.listaclientePorNombre(filtro+"%");
		m.addAttribute("cliente", lista);
		return "crudcliente";
	}
	
	@RequestMapping("/registraActualizaCrudcliente")
	public String registraActualiza(cliente obj, Model m) {
		servicio.insertaActualizacliente(obj);
		List<cliente> lista =  servicio.listacliente();
		m.addAttribute("clientes", lista);
		return "crudcliente";
	}
	
	@RequestMapping("/eliminaCrudcliente")
	public String elimina(int id, Model m) {
		servicio.eliminacliente(id);
		List<cliente> lista =  servicio.listacliente();
		m.addAttribute("clientes", lista);
		return "crudcliente";
	}
}
