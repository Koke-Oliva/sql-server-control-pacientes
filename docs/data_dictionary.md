# Diccionario de datos

La base `Control_Pacientes` contiene cinco tablas y cinco relaciones mediante claves foráneas.

## Especialidad

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador de especialidad |
| Nombre | varchar(20) | Sí |  | Nombre de especialidad |

## Comuna

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador de comuna |
| Nombre | varchar(20) | Sí |  | Nombre de comuna |

## Odontologo

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador del odontólogo |
| RUN | varchar(13) | No |  | Identificador ficticio |
| Nombre | varchar(50) | No |  | Nombre ficticio |
| Apellido | varchar(80) | No |  | Apellido ficticio |
| Fecha_Nac | date | Sí |  | Fecha ficticia |
| ID_Especialidad | int | Sí | FK | Referencia a Especialidad |
| Direccion | varchar(255) | Sí |  | Dirección ficticia |
| ID_Comuna | int | Sí | FK | Referencia a Comuna |
| email | varchar(120) | Sí |  | Email ficticio |
| Telefono | varchar(15) | Sí |  | Teléfono ficticio |

## Paciente

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador del paciente |
| RUN | varchar(13) | No |  | Identificador ficticio |
| Nombre | varchar(50) | No |  | Nombre ficticio |
| Apellido | varchar(80) | No |  | Apellido ficticio |
| Fecha_Nac | date | Sí |  | Fecha ficticia |
| Direccion | varchar(255) | Sí |  | Dirección ficticia |
| ID_Comuna | int | Sí | FK | Referencia a Comuna |
| email | varchar(120) | Sí |  | Email ficticio |
| Telefono | varchar(15) | Sí |  | Teléfono ficticio |

## Cita

| Campo | Tipo | Nulo | Clave | Descripción |
|---|---|---|---|---|
| ID | int | No | PK | Identificador de la cita |
| Fecha_Hora | datetime | No |  | Fecha y hora de la cita |
| ID_Odontologo | int | No | FK | Referencia a Odontologo |
| ID_Paciente | int | No | FK | Referencia a Paciente |

## Relaciones

- `Odontologo.ID_Especialidad → Especialidad.ID`
- `Odontologo.ID_Comuna → Comuna.ID`
- `Paciente.ID_Comuna → Comuna.ID`
- `Cita.ID_Odontologo → Odontologo.ID`
- `Cita.ID_Paciente → Paciente.ID`
