# Revisión técnica de la Prueba 1

## Diagnóstico general

La prueba evidencia un salto respecto de consultas SQL de una sola tabla: exige combinar entidades, agregar resultados, filtrar grupos, consultar atributos relacionados mediante subconsultas y crear una vista reutilizable.

La entrega original es útil como evidencia académica, pero contiene algunos detalles que conviene corregir en una versión de portafolio.

## Revisión por consulta

| Query | Evaluación de la entrega original | Mejora aplicada en portafolio |
|---|---|---|
| 1 | JOIN correcto entre Paciente y Comuna | Alias semánticos y nombres de columnas más claros |
| 2 | LEFT JOIN correcto e inclusión de odontólogos sin comuna | Predicado explícito `<> 'Santiago' OR IS NULL` |
| 3 | Conteo y agrupación correctos para los datos actuales | `LEFT JOIN` y agrupación por ID para cubrir pacientes con cero citas y evitar colisiones de nombres |
| 4 | `GROUP BY` + `HAVING` correctamente utilizados | Agrupación adicional por ID y ordenamiento de salida |
| 5 | JOINs correctos, pero el apellido del odontólogo apunta al alias del paciente | Corrección a `o.Apellido` y filtro sargable por intervalo de fecha |
| 6 | Subconsulta correlacionada adecuada al requerimiento | Se elimina `ISNULL` innecesario alrededor de `COUNT(*)` |
| 7 | Primera solución obtiene comuna/especialidad con subconsultas, pero omite el orden requerido | Se agrega `ORDER BY Especialidad` |
| 8 | La vista combina las tablas correctas, pero el apellido del odontólogo toma el alias del paciente y el ID no queda personalizado | Se corrigen los alias y se nombran explícitamente todas las columnas |

## Query 5: por qué se cambia el filtro de fecha

La entrega original aplica `CONVERT(VARCHAR(10), Fecha_Hora, 121)` sobre la columna. Funciona para el dataset, pero obliga a transformar cada valor antes de compararlo.

La versión revisada utiliza:

```sql
WHERE c.Fecha_Hora >= '20160128'
  AND c.Fecha_Hora <  '20160129'
```

Este patrón conserva correctamente todas las horas del día y es más compatible con el uso de un índice sobre `Fecha_Hora` si existiera.

## Código de la profesora dentro del archivo original

El script original incluye fragmentos marcados como `Forma 1 Profe`, `Forma 2 Profe` y `Otra forma (la profe)`.

Esos fragmentos pertenecen al archivo histórico original. **No se incorporan como trabajo propio** en los scripts revisados.

## Extensión posterior

`sql/04_validation_checks.sql` no pertenece a la Prueba 1. Se añade después para mostrar controles básicos de volumen, duplicados e integridad referencial.

## Nivel técnico defendible

El proyecto permite sostener experiencia formativa con:

- `INNER JOIN` y `LEFT JOIN`;
- múltiples JOIN en una misma consulta;
- `COUNT`, `GROUP BY`, `HAVING`;
- filtrado de `datetime`;
- subconsultas correlacionadas y escalares;
- `CREATE VIEW`;
- lectura de un esquema relacional con PK/FK.

No debe presentarse como evidencia suficiente de SQL avanzado en sentido amplio. No incluye CTE, ventanas, stored procedures, triggers, transacciones complejas, análisis de planes de ejecución ni tuning.
