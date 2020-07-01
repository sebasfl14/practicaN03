package com.redsocial.repositorio;

import java.util.List;

import com.redsocial.entidad.cliente;

public interface clienteRepositorio  {
	
	public cliente insertaActualizacliente(cliente obj);
	public void eliminacliente(int idModalidad);
	public List<cliente> listacliente();
	public List<cliente> listaclientePorNombre(String nom);
	public List<cliente> listacliente(int idDeporte, String nombre);
	
}
