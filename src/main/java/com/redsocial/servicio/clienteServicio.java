package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.cliente;

public interface clienteServicio {

	public cliente insertaActualizacliente(cliente obj);
	public void eliminacliente(int idcliente);
	public List<cliente> listacliente();
	public List<cliente> listaclientePorNombre(String nom);
	public List<cliente> listacliente(int idcategoria, String nombre);

}
