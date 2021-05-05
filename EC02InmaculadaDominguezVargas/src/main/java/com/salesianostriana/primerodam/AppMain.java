package com.salesianostriana.primerodam;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.salesianostriana.primerodam.dao.CrudAlumnoEnMemoria;
import com.salesianostriana.primerodam.dao.ICrudAlumno;
import com.salesianostriana.primerodam.modelo.Alumno;
import com.salesianostriana.primerodam.servicios.AlumnoServicio;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AppMain {

	private final ICrudAlumno ca;
	private final AlumnoServicio as;
	
	@PostConstruct
	public void mimain() {
		
		Map <Long, Alumno> listado = new HashMap <Long, Alumno> ();
		
		
		Scanner sc = new Scanner (System.in);
		String aux, nombre, apellidos, email, fecha;
		boolean loop = true;
		int op = 1, contador = 4, id;
		
		Alumno a = new Alumno (1, "Juan", "Medina Cabrera", LocalDate.of(2002, 12, 31), "juanito17@gmail.com");
		Alumno a1 = new Alumno (2, "María", "García García", LocalDate.of(2002, 01, 01), "mariagg02@gmail.com");
		Alumno a3 = new Alumno (3, "Ana", "López Lozano", LocalDate.of(2002, 02, 27), "analo@gmail.com");
		Alumno a4 = new Alumno (4, "Marco", "Fernández Márquez", LocalDate.of(2002, 06, 11), "marcos_márquez@gmail.com");
		Alumno alumno = new Alumno ();
		
		
		as.insertar(a1);
		as.insertar(a3);
		as.insertar(a);
		as.insertar(a4);
		
		
		
		System.out.println("¡Hola! Bienvenido a nuestro programa.");
		
		do {
			
		
			System.out.println("\n¿Qué es lo que deseas hacer?");
			System.out.println("1. Mostrar alumnos por orden alfabético.");
			System.out.println("2. Mostrará los alumnos por orden de edad a 31/12.");
			System.out.println("3. Añadir alumno.");
			System.out.println("4. Editar alumno.");
			
			do {
				
				try {
					aux = sc.nextLine();
					op = Integer.parseInt(aux);
					
					switch (op) {
					case 1:
						System.out.println("\nAlumnos ordenados alfabéticamente.\n");
						as.getByOrdenAlfabetico().forEach(System.out::println);
						break;
					case 2:
						System.out.println("\nAlumnos ordenados por edad.\n");
						as.getByEdad().forEach(System.out::println);
						break;
					case 3:
						contador++;
						System.out.println("Introduce un nombre.");
						nombre = sc.nextLine();
						System.out.println("Introduce los apellidos.");
						apellidos = sc.nextLine();
						System.out.println("Introduce la fecha de nacimiento.");
						fecha = sc.nextLine();
						System.out.println("Introduce una dirección de correo.");
						email = sc.nextLine();
						ca.insert(new Alumno (contador, nombre, apellidos, LocalDate.parse(fecha), email));
						
						break;
					case 4:
						System.out.println("Introduzca el id del alumno que quiere editar.");
						aux = sc.nextLine();
						id = Integer.parseInt(aux);
						System.out.println(ca.findOne(id));
						System.out.println("Inserte la nueva dirección de correo del alumno.");
						email = sc.nextLine();
						ca.edit(alumno);
						System.out.println(ca.findOne(id));
						break;
		
					default:
						break;
					}
					loop = false;
				}
				
				catch (NumberFormatException numberFormatException) {
					 sc.nextLine();
					 System.err.printf( "\nExcepción: %s\n", numberFormatException);
					 System.out.println("Debe introducir números. Inténtelo de nuevo.\n" );
	
				}
				
				catch(Exception excepcion) {
					System.out.println("¡Ups! Parece que ha habido un error inesperado. Inténtelo de nuevo");
					
				}
			}while(loop);
		
		}while(op!=0);
		
	}
}
