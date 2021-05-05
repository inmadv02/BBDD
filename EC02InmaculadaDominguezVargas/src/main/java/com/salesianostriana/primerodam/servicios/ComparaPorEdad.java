package com.salesianostriana.primerodam.servicios;

import java.util.Comparator;

import com.salesianostriana.primerodam.modelo.Alumno;

public class ComparaPorEdad implements Comparator <Alumno>{

	@Override
	public int compare(Alumno o1, Alumno o2) {
		
		if(o1.getFechaNacimiento().isAfter(o2.getFechaNacimiento())) {
			return 1;
		}
		else {
			if (o1.getFechaNacimiento().isBefore(o2.getFechaNacimiento())) {
				return -1;
			}
			return 0;
		}
	}

}
