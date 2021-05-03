package com.salesianostrianadam.dam.ejemplo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@ToString
@EqualsAndHashCode
@AllArgsConstructor

public class Persona {

	private String nombre;
	private String apellidos;
	
	public Persona() {
		super();
		this.nombre = "Luismi";
		this.apellidos = "López";
	}
	
	
}
