# Grupo_05_Sutran_25_II
---
## Introducción

La Superintendencia de Transporte Terrestre de Personas, Carga y Mercancías (SUTRAN) requiere integrar y analizar grandes volúmenes de datos provenientes de distintas fuentes internas y externas. Para ello, se propone una arquitectura de Business Intelligence (BI) apoyada en un Data Warehouse.



### 1. Ingesta y Preparación de Datos

* **Fuentes de Datos:** La arquitectura se alimenta de fuentes internas de SUTRAN (`Infracciones y sanciones`, `Fiscalizaciones y actas`), así como de datos externos (`SUNARP`, `Clima y mapas viales`).
* **Orquestación:** **Apache Airflow** actúa como el cerebro del sistema, automatizando y programando los flujos de trabajo de datos (ETL) desde la ingesta hasta la carga en los Data Marts.
* **Área de Preparación (Staging Area):** Los datos brutos se almacenan y procesan aquí. Herramientas como **Apache Spark** y **PostgreSQL** se utilizan para realizar tareas críticas como la limpieza, depuración y transformación, asegurando la calidad de los datos antes de su uso.



### 2. Almacenamiento y Modelado Analítico con Data Marts

Esta capa implementa la metodología Kimball a través del **modelado dimensional**. Los datos limpios se cargan en **cuatro Data Marts** principales, cada uno diseñado para un proceso de negocio específico de SUTRAN.

* **DM Fiscalización y Sanciones:** Provee a los analistas de SUTRAN con la información clave sobre las operaciones en carretera. Contiene métricas como `cantidad_infracciones` y `monto_sancion`, que se pueden analizar por **dimensión** (ej. `Dim_Inspector`, `Dim_Ubicacion`).
* **DM Gestión de Autorizaciones:** Se enfoca en el proceso administrativo. Permite monitorear el `número_de_permisos_emitidos` y el `tiempo_de_trámite`, analizados por dimensiones como `Solicitante` y `Fecha`.
* **DM Atención al Ciudadano y Denuncias:** Diseñado para entender las quejas y reclamos. Contiene métricas como `cantidad_de_denuncias` y `tiempo_de_respuesta`, permitiendo a SUTRAN evaluar su eficiencia.
* **DM Movilidad y Tráfico:** Proporciona un contexto valioso al integrar datos externos. Permite a los usuarios analizar la relación entre `índice_de_siniestros` y el `estado_del_clima`.

El Data Warehouse, con **Hadoop**, actúa como el repositorio central y escalable que consolida la información de todos los Data Marts.

---

### 3. Visualización y Gobernanza

* **Visualización:** Los usuarios finales interactúan con los datos a través de esta capa. **Power BI** es la principal herramienta para crear dashboards e informes interactivos. También se utiliza **Python** para análisis más complejos y modelos predictivos.
* **Gobernanza:** Herramientas como **Azure Purview** y **Apache Atlas** son esenciales para gestionar el linaje y la calidad de los datos. **Azure Monitor** supervisa el rendimiento de toda la arquitectura para detectar problemas a tiempo.
