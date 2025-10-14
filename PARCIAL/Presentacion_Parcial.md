# MODELO DIMENSIONAL DE DATA WAREHOUSE PARA EL ANÁLISIS DE LA SINIESTRALIDAD VIAL EN CARRETERAS (SUTRAN)
## Problematica con SUTRAN
Hemos recolectado datos a través de la búsqueda e identificación de datalibre en el Marco de Gobernanza de Datos del Estado Peruano

Eligiendo como core dataset:
Accidentes de Tránsito en Carreteras (problema principal)
Y complementando con:
- Excesos de velocidad
- Reportes preliminares (para ver tiempo real vs consolidado)

## Problema de negocio
"Alta incidencia de accidentes de tránsito en carretetas nacionales, sin una gestión adecuada de datos que permita identificar patrones de riesgo y tomar decisiones preventivas"

### Necesidades de información:
- Identificar tramos y horarios de mayor riesgo.
- Determinar causas principales de accidentes.
- Relacionar velocidades y siniestros.
- Medir el tiempo de repuesta a reportes preliminar.

### Primeros KPI's identificados
- Número de accidentes por región/tramo.
- % de accidentes con víctimas mortales.
- Promedio de vehículos involucrados por accidente.
- Número de excesos de velocidad por cinemómetro.
- Tiempo promedio entre accidente y reporte preliminar.

---

# KPI's Definidos – Proyecto de Seguridad Vial

Este documento presenta los **Indicadores Clave de Desempeño (KPIs)** definidos para monitorear el desempeño del sistema vial. Los KPIs reflejan las métricas clave que permiten evaluar la evolución de la seguridad vial, identificar áreas de mejora y proporcionar una base para la toma de decisiones estratégicas en el sector.

### KPI 1 – Tasa de siniestros por 10,000 vehículos

| Elemento    | Descripción                                                              |
| ----------- | ------------------------------------------------------------------------ |
| Definición  | Número de siniestros ocurridos por cada 10,000 vehículos en circulación. |
| Fórmula     | (Número de siniestros / Total de vehículos) × 10,000                     |
| Unidad      | Siniestros / 10,000 vehículos                                            |
| Frecuencia  | Anual                                                                    |
| Fuente      | SUTRAN + INEI                                                            |
| Responsable | Gerencia de Seguimiento y Evaluación                                     |

### KPI 2 – Tasa de mortalidad vial (fallecidos por 100,000 habitantes)

| Elemento    | Descripción                                                            |
| ----------- | ---------------------------------------------------------------------- |
| Definición  | Número de fallecidos en accidentes viales por cada 100,000 habitantes. |
| Fórmula     | (Número de fallecidos / Población total) × 100,000                     |
| Unidad      | Fallecidos / 100,000 habitantes                                        |
| Frecuencia  | Anual                                                                  |
| Fuente      | SUTRAN + INEI                                                          |
| Responsable | Gerencia de Seguimiento y Evaluación                                   |

### KPI 3 – Índice de siniestralidad por tramo vial (accidentes/km)

| Elemento    | Descripción                                                       |
| ----------- | ----------------------------------------------------------------- |
| Definición  | Promedio de accidentes por kilómetro de tramo vial.               |
| Fórmula     | Número de accidentes en tramo vial / Longitud total de tramo vial |
| Unidad      | Accidentes / km                                                   |
| Frecuencia  | Trimestral                                                        |
| Fuente      | SUTRAN + Ministerio de Transporte                                 |
| Responsable | Gerencia de Supervisión y Fiscalización                           |

### KPI 4 – % de siniestros con causa atribuida al conductor

| Elemento    | Descripción                                                                                                                              |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Definición  | Porcentaje de accidentes viales que se atribuyen a causas relacionadas con el conductor, como velocidad excesiva, alcohol o imprudencia. |
| Fórmula     | (Número de siniestros con causa atribuida al conductor / Total de siniestros) × 100                                                      |
| Unidad      | %                                                                                                                                        |
| Frecuencia  | Mensual                                                                                                                                  |
| Fuente      | SUTRAN + Policía Nacional                                                                                                                |
| Responsable | Gerencia de Prevención                                                                                                                   |

### KPI 5 – % de vehículos sin SOAT o CITV involucrados en accidentes

| Elemento    | Descripción                                                                                              |
| ----------- | -------------------------------------------------------------------------------------------------------- |
| Definición  | Porcentaje de vehículos involucrados en accidentes que no cuentan con el SOAT o CITV.                    |
| Fórmula     | (Número de vehículos sin SOAT o CITV involucrados / Total de vehículos involucrados en accidentes) × 100 |
| Unidad      | %                                                                                                        |
| Frecuencia  | Mensual                                                                                                  |
| Fuente      | SUTRAN + Registros de accidentes                                                                         |
| Responsable | Gerencia de Supervisión y Fiscalización                                                                  |

### KPI 6 – % de accidentes fatales en franjas horarias críticas (20:00–02:00)

| Elemento    | Descripción                                                                              |
| ----------- | ---------------------------------------------------------------------------------------- |
| Definición  | Proporción de accidentes fatales ocurridos en franjas horarias críticas (20:00 a 02:00). |
| Fórmula     | (Número de accidentes fatales en franja crítica / Total de accidentes fatales) × 100     |
| Unidad      | %                                                                                        |
| Frecuencia  | Mensual                                                                                  |
| Fuente      | SUTRAN + Policía Nacional                                                                |
| Responsable | Gerencia de Prevención                                                                   |

### KPI 7 – Tiempo promedio de atención de accidentes

| Elemento    | Descripción                                                                    |
| ----------- | ------------------------------------------------------------------------------ |
| Definición  | Tiempo promedio entre el momento del accidente y el reporte oficial del mismo. |
| Fórmula     | Σ(Fecha de reporte - Fecha de accidente) / N                                   |
| Unidad      | Minutos                                                                        |
| Frecuencia  | Mensual                                                                        |
| Fuente      | SUTRAN + Autoridades locales                                                   |
| Responsable | Gerencia de Articulación Territorial                                           |

### KPI 8 – Tasa de reincidencia de conductores sancionados

| Elemento    | Descripción                                                                 |
| ----------- | --------------------------------------------------------------------------- |
| Definición  | Porcentaje de conductores sancionados que reinciden en infracciones viales. |
| Fórmula     | (Número de reincidentes / Número total de sancionados) × 100                |
| Unidad      | %                                                                           |
| Frecuencia  | Trimestral                                                                  |
| Fuente      | SUTRAN + Policía Nacional                                                   |
| Responsable | Gerencia de Procedimientos y Sanciones                                      |

### KPI 9 – Distribución de accidentes por modalidad de transporte

| Elemento    | Descripción                                                                                                                         |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Definición  | Proporción de accidentes clasificados por modalidad de transporte (vehículos particulares, transporte público, motocicletas, etc.). |
| Fórmula     | (Número de accidentes por modalidad de transporte / Total de accidentes) × 100                                                      |
| Unidad      | %                                                                                                                                   |
| Frecuencia  | Mensual                                                                                                                             |
| Fuente      | SUTRAN + Registros de accidentes                                                                                                    |
| Responsable | Gerencia de Estudios y Normas                                                                                                       |

### KPI 10 – Evolución de accidentes en concesiones viales vs. no concesionadas

| Elemento    | Descripción                                                                                                      |
| ----------- | ---------------------------------------------------------------------------------------------------------------- |
| Definición  | Comparación de la evolución de accidentes en carreteras concesionadas frente a las no concesionadas.             |
| Fórmula     | ((Número de accidentes en concesionadas - Número de accidentes en no concesionadas) / Total de accidentes) × 100 |
| Unidad      | %                                                                                                                |
| Frecuencia  | Anual                                                                                                            |
| Fuente      | SUTRAN + Ministerio de Transporte                                                                                |
| Responsable | Oficina de Planeamiento y Presupuesto                                                                            |


## Arquitectura
![](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/PC1/arquitecturaa.png?raw=true)

---
# Metodologia Hefesto

## 📊 Preguntas del Negocio – Proyecto SUTRAN:

Este documento presenta las preguntas clave de negocio, los roles involucrados y las fuentes de datos asociadas para el análisis de seguridad vial en el proyecto SUTRAN.

### Pregunta 1 – ¿Cómo evoluciona la tasa de siniestros por cada 10,000 vehículos a nivel nacional y por región?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Seguimiento y Evaluación                                       |
| **Rol del Usuario** | Director/a de Seguridad Vial                                               |
| **Pregunta de Negocio** | ¿Cómo evoluciona la tasa de siniestros por cada 10,000 vehículos a nivel nacional y por región? |
| **Prioridad**  | Alta                                                                       |
| **Fuente de Datos** | Dataset 6 (siniestros/vehículos) + INEI                                   |


### Pregunta 2 – ¿Qué tan efectiva es la concesión vial vs. vías no concesionadas?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Oficina de Planeamiento y Presupuesto                                      |
| **Rol del Usuario** | Jefatura de Planeamiento                                                   |
| **Pregunta de Negocio** | ¿Qué tan efectiva es la concesión vial vs. vías no concesionadas?           |
| **Prioridad**  | Media                                                                     |
| **Fuente de Datos** | Dataset 2 (carreteras) + Dataset 9 (OSITRAN)                              |


### Pregunta 3 – ¿En qué tramos viales hay mayor accidentes/km para priorizar operativos?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Supervisión y Fiscalización                                     |
| **Rol del Usuario** | Jefe/a de Fiscalización                                                   |
| **Pregunta de Negocio** | ¿En qué tramos viales hay mayor accidentes/km para priorizar operativos? |
| **Prioridad**  | Alta                                                                       |
| **Fuente de Datos** | Dataset 2 + Dataset 9                                                     |


### Pregunta 4 – ¿Qué % de siniestros se atribuye a causas del conductor?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Prevención                                                      |
| **Rol del Usuario** | Coordinación de Prevención                                                  |
| **Pregunta de Negocio** | ¿Qué % de siniestros se atribuye a causas del conductor?                 |
| **Prioridad**  | Alta                                                                       |
| **Fuente de Datos** | Dataset 3/4/6 (ONSV)                                                     |

### Pregunta 5 – ¿Qué % de vehículos accidentados no tenía SOAT/CITV vigente?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Supervisión y Fiscalización                                     |
| **Rol del Usuario** | Gestión Vehicular/Fiscalización                                            |
| **Pregunta de Negocio** | ¿Qué % de vehículos accidentados no tenía SOAT/CITV vigente?             |
| **Prioridad**  | Alta                                                                       |
| **Fuente de Datos** | Dataset 5 (vehículos ONSV)                                               |



### Pregunta 6 – ¿Cuál es el tiempo promedio ocurrencia → reporte de un accidente?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Articulación Territorial                                        |
| **Rol del Usuario** | Supervisor/a (UD)                                                          |
| **Pregunta de Negocio** | ¿Cuál es el tiempo promedio ocurrencia → reporte de un accidente?        |
| **Prioridad**  | Media                                                                     |
| **Fuente de Datos** | Dataset 9 (OSITRAN) + Dataset 10 (reportes)                                |



### Pregunta 7 – ¿Cuál es la tasa de reincidencia de conductores sancionados?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Procedimientos y Sanciones                                      |
| **Rol del Usuario** | Jefe/a de Sanciones                                                       |
| **Pregunta de Negocio** | ¿Cuál es la tasa de reincidencia de conductores sancionados?             |
| **Prioridad**  | Media                                                                     |
| **Fuente de Datos** | Dataset 3 (personas ONSV)                                                |


### Pregunta 8 – ¿Qué modalidades concentran más accidentes?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Estudios y Normas                                               |
| **Rol del Usuario** | Planeamiento/Estudios                                                      |
| **Pregunta de Negocio** | ¿Qué modalidades concentran más accidentes?                             |
| **Prioridad**  | Media                                                                     |
| **Fuente de Datos** | Dataset 2/5/6                                                              |


### Pregunta 9 – ¿Qué % de accidentes fatales ocurre en 20:00–02:00?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Prevención                                                      |
| **Rol del Usuario** | Centro de Control                                                          |
| **Pregunta de Negocio** | ¿Qué % de accidentes fatales ocurre en 20:00–02:00?                    |
| **Prioridad**  | Media                                                                     |
| **Fuente de Datos** | Dataset 2/4/6                                                              |


### Pregunta 10 – ¿Dónde están los hotspots de infracciones?
| **Elemento**   | **Descripción**                                                            |
|----------------|----------------------------------------------------------------------------|
| **Área**       | Gerencia de Supervisión y Fiscalización                                     |
| **Rol del Usuario** | Jefe/a de Operativos                                                     |
| **Pregunta de Negocio** | ¿Dónde están los hotspots de infracciones?                             |
| **Prioridad**  | Alta                                                                       |
| **Fuente de Datos** | SUTRAN (fiscalización)                                                   |

---
## Inventario OLTP
Este documento presenta los **sistemas y registros** definidos para el proyecto, con detalles sobre las áreas usuarias, tecnologías, frecuencias de actualización y observaciones. A continuación, se detallan los sistemas relevantes con sus respectivas características.

### 1. Gestión de Infracciones y Sanciones

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Procedimientos y Sanciones                                      |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | PostgreSQL/Oracle (app transaccional)                                        |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Actas, códigos de infracción, montos, puntos. Base para reincidencia (con cruce personas) y hotspots. Reglas de deduplicación. |


###  2. Atención al Ciudadano (Denuncias)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Articulación Territorial                                        |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | WebApp + BD transaccional                                                   |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Denuncias, SLA de respuesta y canal. Contexto operativo; puede alimentar alertas y tiempos de atención. |


###  3. Control de Pesos y Medidas (Balanzas)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | Sensores/CSV batch → BD operativa                                           |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Eventos de sobrepeso por placa/ubicación. Enriquecen análisis de tramos y operativos. |



### 4. Autorizaciones y Habilitaciones

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Administración                                                   |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | Oracle/SOA (trámites)                                                        |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Permisos/licencias de operación. Útil para formalización y cruces con infracciones. |



###  5. Carreteras y Tramos (red vial SUTRAN)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Planeamiento y Presupuesto + Gerencia de Supervisión y Fiscalización |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | PostgreSQL/Geodatos (GIS)                                                   |
| **Frecuencia de actualización**    | Mensual (actualización de catálogos)                                         |
| **Observaciones**                  | Catálogo de tramos/km. Clave para accidentes/km y alineación con OSITRAN.  |



###  6. Registro de Conductores y Licencias (MTC)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/Intercambio de archivos                                                 |
| **Frecuencia de actualización**    | Semanal                                                                     |
| **Observaciones**                  | Estado de licencias y sanciones. Soporta controles en carretera y reincidencia. |


### 7. SOAT (Aseguradoras / SBS)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/CSV (reportes)                                                          |
| **Frecuencia de actualización**    | Semanal                                                                     |
| **Observaciones**                  | Vigencia de pólizas. Insumo para % sin SOAT en accidentes (cruce con ONSV/SUTRAN). |



###  8. CITV – Revisiones Técnicas

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/CSV                                                                     |
| **Frecuencia de actualización**    | Semanal                                                                     |
| **Observaciones**                  | Vigencia de revisión técnica por placa. Insumo para % sin CITV.             |


###  9. OSITRAN – Concesiones Viales

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Planeamiento y Presupuesto                                        |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/CSV (regulatorio)                                                       |
| **Frecuencia de actualización**    | Mensual (cierres t/a)                                                       |
| **Observaciones**                  | Red concesionada, km y eventos. Base para concesionadas vs. no concesionadas y para accidentes/km (alinear catálogos). |


###  10. ONSV – Observatorio de Seguridad Vial

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Seguimiento y Evaluación                                        |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | CSV/Excel/API (publicaciones)                                               |
| **Frecuencia de actualización**    | Mensual (algunos cortes anuales)                                            |
| **Observaciones**                  | Siniestros, víctimas, causas, parque vehicular. Alimenta tasa siniestros/10k, tasa mortalidad, % causa conductor, franja horaria. |



### 11. INEI – Población y Parque Vehicular

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Planeamiento y Presupuesto                                        |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | CSV/Excel                                                                   |
| **Frecuencia de actualización**    | Anual                                                                       |
| **Observaciones**                  | Población y parque por región/tipo. Denominadores para tasas (10k vehículos, 100k hab.). |



### 12. Reportes Operativos/Preliminares (Centro de Control)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Articulación Territorial                                        |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | Formularios/CSV→BD                                                          |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Marca de ocurrencia y hora de notificación. Clave para tiempo promedio de atención. |

---
## 📊 Diseño del Modelo de Datos para SUTRAN - Data Marts 
### 1. DM de Fiscalización y Sanciones 🛡️

**Propósito:** Analizar la recurrencia de las infracciones, el perfil de riesgo de los transportistas, y la intervención de control (fiscalización).

#### a. Perspectivas (Dimensiones)

| Dimensión | Descripción | Campos Originales Usados | Origen del Dato |
| :--- | :--- | :--- | :--- |
| **Tiempo** | Momento del siniestro y la fecha de corte del reporte. | `FECHA_CORTE`,, `AÑO`, `MES` | D1, D3, D2, D4 |
| **Ubicación** | Lugar exacto donde ocurrió el evento. | `DEPARTAMENTO`, `PROVINCIA`, `DISTRITO`, `CODIGO_VÍA`, `KILOMETRO`, `COORDENADAS LATITUD/LONGITUD` | D1, D3, D6, D5 |
| **Infracción** | infracción cometida. | `CAUSA FACTOR PRINCIPAL`, `CAUSA ESPECÍFICA` | D3, D2 |
| **Transportista** | Perfil de la entidad (vehículo/conductor) que es sujeto potencial de fiscalización. | `VEHÍCULO`, `MODALIDAD DE TRANSPORTE`, `CLASE_LICENCIA`, `ESTADO SOAT`, `ESTADO CITV` | D4, D2 |
| **Sanción (Acción)** | Indica si se tomó alguna acción administrativa. | `ACCIONES TOMADAS` | D5 (OSITRAN) |

#### b. Indicadores (Hechos)

| Indicador | Tipo de Medida | Campo Original Usado | Observación (Métrica de Control) |
| :--- | :--- | :--- | :--- |
| **Total de Siniestros** | Aditivo (Count) | `CÓDIGO SINIESTRO` | Conteo de los eventos que detonan el proceso de fiscalización. |
| **Cantidad de Afectados** | Aditivo (Sum) | `PERSONAS AFECTADAS` | Mide la gravedad del incidente a fiscalizar. |
| **Contador de Fallecidos** | Aditivo (Sum) | `CANTIDAD DE FALLECIDOS` | Métrica clave para la gestión de la seguridad vial. |
| **Contador de Vehículos Involucrados** | Aditivo (Sum) | `VEHÍCULOS INV.` | Mide el alcance de la fiscalización del evento. |
| **Eventos con Acción Tomada** | Semi-Aditivo (Count) | `ACCIONES TOMADAS` (No nulo) | Mide la frecuencia de intervención activa. |

![Fizcalizaciones](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/images/diagrama%20estrella%2001.jpg)


### 2. DM de Siniestros  🏥

**Propósito:** Analizar el impacto real del siniestro en la población y correlacionar la gravedad de las lesiones con los factores causales.

#### a. Perspectivas (Dimensiones)

| Dimensión | Descripción | Campos Originales Usados | Origen del Dato |
| :--- | :--- | :--- | :--- |
| **Tiempo** | Momento exacto del siniestro. | `FECHA SINIESTRO`, `HORA SINIESTRO`, `DÍA` | D3, D2 |
| **Ubicación** | Lugar, características de la vía. | `RED VIAL`, `TIPO DE VÍA`, `ZONIFICACIÓN`, `CONDICIÓN CLIMÁTICA` | D3, D2 |
| **Causa** | Detalle de la causa raíz. | `CAUSA`, `CAUSA ESPECÍFICA` | D2, D3 |
| **Persona (Afectado)** | Perfil de la víctima del siniestro. | `TIPO PERSONA`, `GRAVEDAD`, `EDAD`, `SEXO`, `RESULTADO DEL DOSAJE ETÍLICO CUALITATIVO` | D2 |
| **Vehículo** | Tipo de vehículo y su estado en el momento. | `VEHÍCULO`, `TIPO SEGURO`, `LUGAR IMPACTO VEHÍCULO` | D4 |

#### b. Indicadores (Hechos)

| Indicador | Tipo de Medida | Campo Original Usado | Observación |
| :--- | :--- | :--- | :--- |
| **Total de Fallecidos** | Aditivo (Sum) | `CANTIDAD DE FALLECIDOS` | Mide el impacto más grave del siniestro. |
| **Total de Lesionados** | Aditivo (Sum) | `CANTIDAD DE LESIONADOS` | Mide el total de heridos en el siniestro. |
| **Víctimas con Dosaje Positivo**| Aditivo (Count/Sum) | `RESULTADO DEL DOSAJE ETÍLICO CUALITATIVO` | Indicador clave para el análisis de riesgo por factor humano. |
| **Índice de Gravedad (Calculado)** | Calculado | (`FALLECIDOS` / `HERIDOS + FALLECIDOS`) | Mide la letalidad promedio del evento. |
| **Conteo de Personas Ilesas** | Aditivo (Count) | `GRAVEDAD` = ILESO | Mide la supervivencia en el siniestro. |

![](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/images/diagrama%20estrella%2002.jpg)

---
# Procesos ETL

![](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/images/diagrama_etl.jpg)


### 1. Extracción (Extract - E) y Carga Inicial (Load - L)
Esta primera fase se centra en obtener los datos de diversas fuentes y llevarlos a una zona de almacenamiento temporal (Staging).
| Componente | Rol en el Flujo | Tecnología(s) |
| :--- | :--- | :--- |
| **Fuentes de Datos (Source)** | Datos operacionales e históricos de siniestros, fiscalización y licencias. (Archivos planos, Bases de Datos). | Sistemas internos de SUTRAN, ONSV. |
| **Ingesta (Ingestion)** | Movimiento rápido de la data cruda. Se prioriza la velocidad sobre la transformación. | Apache **NiFi** (para ingesta en lotes). |
| **Zona de Aterrizaje (_Landing Zone_)** | Almacenamiento de la data **cruda** y sin procesamiento. Actúa como la fuente de verdad de la data original. | **HDFS** (Hadoop Distributed File System). |



### 2. Fase de Transformación (Transform - T)

Esta etapa es donde la data cruda se limpia, se valida y se le aplica la lógica de negocio, convirtiéndola en información de alta calidad.

#### Proceso de Transformación (Data Processing)
El motor de esta etapa es **Apache Spark**, que permite ejecutar el procesamiento distribuido en memoria, esencial para la escalabilidad del Big Data.

| Tarea de Transformación | Descripción | Impacto para SUTRAN |
| :--- | :--- | :--- |
| **Limpieza de Datos** | Manejo de valores nulos (e.g., coordenadas, kilometraje), corrección de formatos y tipografía. | Asegurar que la data geográfica sea precisa para el geoposicionamiento de siniestros. |
| **Integración de Datos** | Unir múltiples datasets (e.g., siniestros + vehículos + infracciones). | Calcular el historial de riesgo del conductor o vehículo involucrado. |
| **Enriquecimiento** | Creación de nuevos KPIs y atributos analíticos. | Derivar el Índice de Riesgo por Tramo Vial o la clasificación por franja horaria (`Dim_Tiempo`). |



### 3. Fase de Modelado y Consumo (Load - L)

El último paso es organizar los datos para el análisis de BI, permitiendo consultas rápidas para la toma de decisiones.

| Etapa del Diagrama | Objetivo | Herramientas (Ejemplo) |
| :--- | :--- | :--- |
| **Modelado Dimensional** | Construcción del Modelo Estrella (e.g., `Fact_Siniestro`, `Dim_Ubicacion`, `Dim_Causa_Siniestro`). | **SparkSQL** (para consultas y estructuración). |
| **Data Warehouse (DW)** | Repositorio final del modelo dimensional, optimizado para el rendimiento de las consultas analíticas. | **Hive**(sobre HDFS). |
| **Consumo y Visualización** | Acceso del usuario de negocio a través de herramientas visuales. | **Power BI** conectada al DW. |
