# Implementación de Procesos ETL
![](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/images/diagrama_etl.jpg)

---

## 1. Extracción (Extract - E) y Carga Inicial (Load - L)
Esta primera fase se centra en obtener los datos de diversas fuentes y llevarlos a una zona de almacenamiento temporal (Staging).
| Componente | Rol en el Flujo | Tecnología(s) |
| :--- | :--- | :--- |
| **Fuentes de Datos (Source)** | Datos operacionales e históricos de siniestros, fiscalización y licencias. (Archivos planos, Bases de Datos). | Sistemas internos de SUTRAN, ONSV. |
| **Ingesta (Ingestion)** | Movimiento rápido de la data cruda. Se prioriza la velocidad sobre la transformación. | Apache **NiFi** (para ingesta en lotes). |
| **Zona de Aterrizaje (_Landing Zone_)** | Almacenamiento de la data **cruda** y sin procesamiento. Actúa como la fuente de verdad de la data original. | **HDFS** (Hadoop Distributed File System). |



## 2. Fase de Transformación (Transform - T)

Esta etapa es donde la data cruda se limpia, se valida y se le aplica la lógica de negocio, convirtiéndola en información de alta calidad.

### Proceso de Transformación (Data Processing)
El motor de esta etapa es **Apache Spark**, que permite ejecutar el procesamiento distribuido en memoria, esencial para la escalabilidad del Big Data.

| Tarea de Transformación | Descripción | Impacto para SUTRAN |
| :--- | :--- | :--- |
| **Limpieza de Datos** | Manejo de valores nulos (e.g., coordenadas, kilometraje), corrección de formatos y tipografía. | Asegurar que la data geográfica sea precisa para el geoposicionamiento de siniestros. |
| **Integración de Datos** | Unir múltiples datasets (e.g., siniestros + vehículos + infracciones). | Calcular el historial de riesgo del conductor o vehículo involucrado. |
| **Enriquecimiento** | Creación de nuevos KPIs y atributos analíticos. | Derivar el Índice de Riesgo por Tramo Vial o la clasificación por franja horaria (`Dim_Tiempo`). |



## 3. Fase de Modelado y Consumo (Load - L)

El último paso es organizar los datos para el análisis de BI, permitiendo consultas rápidas para la toma de decisiones.

| Etapa del Diagrama | Objetivo | Herramientas (Ejemplo) |
| :--- | :--- | :--- |
| **Modelado Dimensional** | Construcción del Modelo Estrella (e.g., `Fact_Siniestro`, `Dim_Ubicacion`, `Dim_Causa_Siniestro`). | **SparkSQL** (para consultas y estructuración). |
| **Data Warehouse (DW)** | Repositorio final del modelo dimensional, optimizado para el rendimiento de las consultas analíticas. | **Hive**(sobre HDFS). |
| **Consumo y Visualización** | Acceso del usuario de negocio a través de herramientas visuales. | **Power BI** conectada al DW. |
