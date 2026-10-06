# Alcance de la Prueba 1

## Contexto

La evaluación pertenece al curso **Herramientas para la Programación de Queries con SQL**, de Educación Continua UC.

La pauta indica que el trabajo debía realizarse utilizando la base de datos `Control_Pacientes` y resolver ocho requerimientos SQL.

## Organización de la evaluación

### JOIN y LEFT JOIN

- Query 1: pacientes con RUN, nombre, apellido y nombre de comuna; ordenar por comuna y nombre.
- Query 2: odontólogos que no sean de Santiago, incluyendo aquellos sin comuna.
- Query 3: contar las atenciones de cada paciente.
- Query 4: odontólogos que hayan realizado 10 o más atenciones.
- Query 5: citas agendadas el 28-01-2016, mostrando paciente, fecha/hora y odontólogo.

### Subconsultas

- Query 6: contar atenciones por paciente utilizando una subconsulta.
- Query 7: mostrar odontólogos, comuna y especialidad, obteniendo comuna y especialidad mediante subconsultas y ordenando por especialidad.

### Vistas

- Query 8: crear `View_Cita_Completa` con datos de la cita, odontólogo, especialidad y paciente, personalizando los nombres de las columnas.

## Archivos de origen

La pauta establece que las consultas debían resolverse sobre `Control_Pacientes`. El script de preparación de tablas y datos se trata como **archivo de entorno**, no como evidencia principal del trabajo evaluado.

La entrega original se conserva por separado de la versión revisada de portafolio.

## Criterio de portafolio

Las consultas de `sql/` son una revisión posterior orientada a legibilidad y buenas prácticas. Cualquier corrección respecto de la entrega original está documentada y no se presenta como si hubiera formado parte de la evaluación entregada.
