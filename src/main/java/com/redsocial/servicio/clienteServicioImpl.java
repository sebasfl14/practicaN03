package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.cliente;
import com.redsocial.repositorio.clienteRepositorio;

@Service
public class clienteServicioImpl implements clienteServicio{

	@Autowired
	private clienteRepositorio repositorio;

	@Override
	public cliente insertaActualizacliente(cliente obj) {
		return repositorio.insertaActualizacliente(obj);
	}

	@Override
	public void eliminacliente(int idcliente) {
		repositorio.eliminacliente(idcliente);
	}

	@Override
	public List<cliente> listacliente() {
		return repositorio.listacliente();
	}

	@Override
	public List<cliente> listaclientePorNombre(String nom) {
		return repositorio.listaclientePorNombre(nom);
	}

	@Override
	public List<cliente> listacliente(int idcategoria, String nombre) {
		return repositorio.listacliente(idcategoria, nombre);
	} 
	


}


