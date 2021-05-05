package com.salesianostriana.primerodam.modelo;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data 
@AllArgsConstructor
//@Component Las clases modelo no son componentes
@RequiredArgsConstructor

public class Alumno {
	
	
	private long id;
	private String nombre;
	private String apellidos;
	private LocalDate fechaNacimiento;
	private String email;
	
	
	public long getEdad() {
		
		long edad = fechaNacimiento.until(LocalDate.of(LocalDate.now().getYear(), 12, 31), ChronoUnit.YEARS);
		
		return edad;
	}
	
	
	

}
