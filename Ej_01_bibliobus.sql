-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Temas"
(
    id_tema serial NOT NULL,
    tipo character varying NOT NULL,
    PRIMARY KEY (id_tema)
);

CREATE TABLE IF NOT EXISTS public."Libros"
(
    id_libros serial NOT NULL,
    titulo character varying NOT NULL,
    autor character varying,
    ejemplares integer,
    id_tema integer NOT NULL,
    PRIMARY KEY (id_libros)
);

CREATE TABLE IF NOT EXISTS public.socios
(
    id_socio serial NOT NULL,
    nombre character varying NOT NULL,
    dni character varying NOT NULL,
    edad integer NOT NULL,
    PRIMARY KEY (id_socio)
);

CREATE TABLE IF NOT EXISTS public."Libros_socios"
(
    "Libros_id_libros" serial NOT NULL,
    socios_id_socio serial NOT NULL,
    fecha_prestamo integer NOT NULL,
    fecha_devolucion integer NOT NULL
);

ALTER TABLE IF EXISTS public."Libros"
    ADD CONSTRAINT id_tema FOREIGN KEY (id_tema)
    REFERENCES public."Temas" (id_tema) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Libros_socios"
    ADD FOREIGN KEY ("Libros_id_libros")
    REFERENCES public."Libros" (id_libros) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Libros_socios"
    ADD FOREIGN KEY (socios_id_socio)
    REFERENCES public.socios (id_socio) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;