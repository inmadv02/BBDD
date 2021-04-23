CREATE TABLE docentes (
    
    dni text,
    nombre text,
	telefono text,
    añoIngreso date,
	CONSTRAINT pk_docentes PRIMARY KEY (dni)
);

CREATE TABLE actividades (

    idAct integer,
    nombre text,
    duracion time,
    CONSTRAINT pk_id_actividades PRIMARY KEY (idAct)

);

CREATE TABLE alumnos (

    cod_alumno integer,
    nombre text,
    telefono text,
    nivel text,
    CONSTRAINT pk_alumno PRIMARY KEY (cod_alumno)

);

CREATE TABLE asignacion_act (

    idDoc text,
    idAct integer,
    diaSemana date,
    hora time,
    CONSTRAINT pk_asignacion PRIMARY KEY (idDoc, idAct, diaSemana, hora)

);

CREATE TABLE asistencia_act (

    idAlum integer,
    idAct integer,
    idDoc text,
    CONSTRAINT pk_asignacion PRIMARY KEY (idDoc, idAct, diaSemana, hora)

);

