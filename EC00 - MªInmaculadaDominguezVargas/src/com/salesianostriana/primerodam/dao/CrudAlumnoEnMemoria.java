package com.salesianostriana.primerodam.dao;

import java.util.List;

import com.salesianostriana.primerodam.modelo.Alumno;

public class CrudAlumnoEnMemoria implements ICrudAlumno {
	
	private List <Alumno> listado;
	
	public CrudAlumnoEnMemoria(List<Alumno> listado) {
		super();
		this.listado = listado;
	}
	
	

	public List<Alumno> getListado() {
		return listado;
	}

	public void setListado(List<Alumno> listado) {
		this.listado = listado;
	}
	

	@Override
	public String toString() {
		return "CrudAlumnoEnMemoria [listado=" + listado + "]";
	}

	
	@Override
	public List<Alumno> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Alumno findOne(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Alumno alumno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void edit(Alumno alumno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Alumno alumno) {
		// TODO Auto-generated method stub
		
	}
	
	

}
