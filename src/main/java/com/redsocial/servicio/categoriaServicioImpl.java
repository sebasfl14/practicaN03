package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.categoria;
import com.redsocial.repositorio.categoriaRepositorio;

@Service
public class categoriaServicioImpl implements categoriaServicio{

	@Autowired
	private categoriaRepositorio repositorio;

	@Override
	public List<categoria> listacategoria() {
		return repositorio.listacategoria();
	} 
	
	

}


