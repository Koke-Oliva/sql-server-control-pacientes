# Resultados de referencia

Estos conteos se obtienen a partir de los datos ficticios del ejercicio y sirven como control básico de reproducibilidad.

| Query | Resultado esperado |
|---|---:|
| 1 | 14 filas |
| 2 | 14 filas |
| 3 | 30 filas |
| 4 | 4 filas |
| 5 | 15 filas |
| 6 | 30 filas |
| 7 | 16 filas |
| 8 | 81 filas en la vista |

## Query 4 — odontólogos con 10 o más atenciones

| Odontólogo | Atenciones |
|---|---:|
| Irene Gallardo | 15 |
| Mario Poblete | 15 |
| Ana Alvarez | 12 |
| Nancy Rojas | 10 |

## Query 5 — fecha solicitada

El 28-01-2016 existen **15 citas**, desde las 10:00 hasta las 17:00 en los datos del ejercicio.

## Observación sobre Query 3

Los 30 pacientes tienen al menos una cita en el dataset actual. Por eso la solución original con `INNER JOIN` y la versión revisada con `LEFT JOIN` producen 30 pacientes. El `LEFT JOIN` se conserva porque refleja mejor la frase “cada paciente” si posteriormente apareciera un paciente sin atenciones.
