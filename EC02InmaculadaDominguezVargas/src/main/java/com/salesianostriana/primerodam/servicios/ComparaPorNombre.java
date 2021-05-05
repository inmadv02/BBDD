package com.salesianostriana.primerodam.servicios;

import java.util.Comparator;

import com.salesianostriana.primerodam.modelo.Alumno;

public class ComparaPorNombre implements Comparator <Alumno>{
	
	
	public int compare(Alumno o1, Alumno o2) {
		
		String nombreo1 = o1.getNombre();
		String nombreo2 = o2.getNombre();
		
		return nombreo1.toLowerCase().compareTo(nombreo2.toLowerCase());
	}

}
