package com.salesianostrianadam.dam.ejemplo;


import java.util.ArrayList;
import java.util.List;

public class App {
    
    public static void main(String[] args) {
    	
    	Persona p = new Persona();
    	Persona p2 = new Persona ("Miguel", "Campos");
    	Persona p3 = new Persona ("Ángel", "Naranjo");
    	
    	
    	System.out.println(p.toString());
    	
    	List <Persona> personas = new ArrayList<>();
    	
    	personas.add(p3);
    	personas.add(p2);
    	personas.add(p);
    }
    
}
