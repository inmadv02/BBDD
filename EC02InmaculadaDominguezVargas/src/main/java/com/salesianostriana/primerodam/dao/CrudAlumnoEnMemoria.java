package com.salesianostriana.primerodam.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.salesianostriana.primerodam.modelo.Alumno;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data 
@AllArgsConstructor
@Repository

public class CrudAlumnoEnMemoria implements ICrudAlumno{
	
	private Map <Long, Alumno> listado = new HashMap <Long, Alumno>();

	@Override
	public List<Alumno> findAll() {
		// TODO Auto-generated method stub
		return Collections
				.unmodifiableList(
						new ArrayList <Alumno> (listado.values()));
	}
	

	@Override
	public Alumno findOne(long id) {
		return listado.get(id);
	}

	@Override
	public void insert(Alumno alumno) {
		long id = newId();
		alumno.setId(id);
		listado.put(id, alumno);
		
	}

	@Override
	public void delete(Alumno alumno) {
		listado.remove(alumno.getId(), alumno);
		
	}

	@Override
	public void edit(Alumno alumno) {
		
		if(alumno.getId() == 0) {
			throw new NoSuchElementException("No existe ningún alumno con ID: " + alumno.getId());
		}
		listado.put(alumno.getId(), alumno);
		
		
	}
	
	private long newId() {
		long max = listado.keySet().stream().max(Comparator.naturalOrder()).orElse(0L);
		
		return max + 1;
	}

}
