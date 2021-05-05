package com.salesianostriana.primerodam.servicios;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.primerodam.dao.CrudAlumnoEnMemoria;
import com.salesianostriana.primerodam.dao.ICrudAlumno;
import com.salesianostriana.primerodam.modelo.Alumno;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data 
@RequiredArgsConstructor
@Service
public class AlumnoServicio {

	 // no hace falta la anotación. A Luismi le gusta más con final detrás del private
	private final ICrudAlumno ca;
	
	public void insertar(Alumno alumno) {
		ca.insert(alumno);
	}
	
	public List<Alumno> findAll() {
		return ca.findAll();
	}
	
	public Alumno findOne(long id) {
		return ca.findOne(id);
		
	}
	
	public void edit(Alumno alumno) {
		ca.edit(alumno);
		
		
	}

	public void delete(Alumno alumno) {
		ca.delete(alumno);
		
	}

	public List<Alumno> getByOrdenAlfabetico(){
		return ca.findAll()
				.stream()
				.sorted(Comparator.comparing(Alumno::getApellidos))
				.collect(Collectors.toUnmodifiableList());
	
	}
	
	public List<Alumno> getByEdad(){
		return ca.findAll()
				.stream()
				.sorted(Comparator.comparing(Alumno::getEdad))
				.collect(Collectors.toUnmodifiableList());
		
	}
	
	//public getBy()
}
