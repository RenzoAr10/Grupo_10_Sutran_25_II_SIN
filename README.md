# Grupo_05_Sutran_25_II

## Introducción

La Superintendencia de Transporte Terrestre de Personas, Carga y Mercancías (SUTRAN) requiere integrar y analizar grandes volúmenes de datos provenientes de distintas fuentes internas y externas. Para ello, se propone una arquitectura de Business Intelligence (BI) apoyada en un Data Warehouse.

## 1. Fuentes de Datos

La arquitectura parte de los sistemas operativos internos (OLTP) y de fuentes externas:

Internos: infracciones, sanciones, fiscalizaciones y actas de control.

Externos: registros de vehículos de SUNARP, condiciones climáticas y mapas viales.

Estas fuentes representan la base de información que luego será transformada para análisis.

## 2. Procesos ETL

Para integrar la información se utilizan procesos ETL (Extract, Transform, Load) orquestados con Apache Airflow.

Extract: se extraen los datos desde las diferentes fuentes.

Transform: se limpian, validan y estandarizan los datos (ejemplo: normalización de placas y catálogos de infracciones).

Load: se cargan los datos en el Data Warehouse para su posterior análisis.

Este proceso asegura que los datos estén listos para ser utilizados en la toma de decisiones.

## 3. Medallion Architecture

El almacenamiento se organiza en tres capas:

Bronze (Hadoop HDFS): guarda los datos en su estado crudo, tal como llegan de las fuentes.

Silver (Apache Spark): contiene los datos ya limpios y estructurados, listos para análisis básicos.

Gold (Snowflake): almacena los datos refinados y preparados para consultas de negocio, reportes y dashboards.



## 4. Consumo de Datos

Una vez preparados, los datos se utilizan de diversas formas:

OLAP: construcción de cubos multidimensionales para análisis rápidos.

Power BI: visualización de indicadores clave de gestión (ejemplo: infracciones por región, recaudación por mes).

Python: análisis avanzado y modelos predictivos, como estimación de riesgos de accidentes.

De esta forma, los datos se convierten en información estratégica para la institución.

## 5. Gobernanza y Seguridad

La arquitectura incluye mecanismos para garantizar seguridad y confianza en los datos:

Azure Purview: catálogo de datos y definiciones de KPIs.

Apache Atlas: seguimiento del linaje de los datos (saber de dónde proviene cada registro).

Azure Monitor: monitoreo del rendimiento de la infraestructura.

