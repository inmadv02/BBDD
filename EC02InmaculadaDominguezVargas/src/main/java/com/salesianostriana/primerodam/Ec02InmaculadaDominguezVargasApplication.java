package com.salesianostriana.primerodam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.salesianostriana.primerodam.dao.CrudAlumnoEnMemoria;
import com.salesianostriana.primerodam.modelo.Alumno;
import com.salesianostriana.primerodam.servicios.AlumnoServicio;

@SpringBootApplication
public class Ec02InmaculadaDominguezVargasApplication {

	public static void main(String[] args) {
		SpringApplication.run(Ec02InmaculadaDominguezVargasApplication.class, args);
		
	}

}
