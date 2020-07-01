package com.redsocial.entidad;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class cliente {

	private int idcliente;

	private String nombre;

	private String apellido;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaNacimiento;

	private String telefono;

	private String email;
	
	private String direccion;

	private categoria categoria;
	
	

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(categoria categoria) {
		this.categoria = categoria;
	}

}
	
	