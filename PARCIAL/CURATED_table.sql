-- en beeline !connect jdbc:hive2://localhost:10000/default maria_dev
CREATE DATABASE IF NOT EXISTS curated;
USE curated;

-- a) SUTRAN 2020–2021 (particiones clave)
CREATE EXTERNAL TABLE IF NOT EXISTS curated.sutran_accidentes_pq (
  fecha_corte STRING,
  fecha DATE,
  hora STRING,
  codigo_via STRING,
  kilometro STRING,
  modalidad STRING,
  fallecidos INT,
  heridos INT
)
PARTITIONED BY (anio INT, departamento STRING)
STORED AS PARQUET
LOCATION '/data/curated/SUTRAN_ACCIDENTES_2020_2021/';

-- b) ONSV SINIESTROS 2021–2023
CREATE EXTERNAL TABLE IF NOT EXISTS curated.onsv_siniestros_pq (
  fecha_siniestro DATE,
  hora_siniestro STRING,
  clase_siniestro STRING,
  cant_fallecidos INT,
  cant_lesionados INT,
  cant_vehiculos_danados INT,
  zona STRING,
  tipo_via STRING,
  red_vial STRING,
  cod_carretera STRING,
  existe_ciclovia STRING,
  coordenada_latitud DOUBLE,
  coordenada_longitud DOUBLE,
  condicion_climatica STRING,
  zonificacion STRING,
  caracteristicas_via STRING,
  perfil_longitudinal_via STRING,
  superficie_calzada STRING,
  existe_senal_vertical STRING,
  clasificacion_senal_vertical_1 STRING,
  clasificacion_senal_vertical_2 STRING,
  existe_senal_horizontal STRING,
  causa_factor_principal STRING,
  causa_especifica STRING
)
PARTITIONED BY (anio INT, departamento STRING, provincia STRING, distrito STRING)
STORED AS PARQUET
LOCATION '/data/curated/BBDD_ONSV_SINIESTROS_2021_2023/';

-- c) ONSV PERSONAS 2021–2023
CREATE EXTERNAL TABLE IF NOT EXISTS curated.onsv_personas_pq (
  codigo_siniestro STRING,
  codigo_vehiculo STRING,
  codigo_persona STRING,
  tipo_persona STRING,
  gravedad STRING,
  lugar_atencion_lesionado STRING,
  lugar_defuncion STRING,
  situacion_persona STRING,
  pais_nacionalidad STRING,
  otro_pais_nacionalidad STRING,
  edad INT,
  sexo STRING,
  posee_licencia STRING,
  estado_licencia STRING,
  clase_licencia STRING,
  dosaje_etilico_cualitativo STRING,
  resultado_dosaje_cualitativo STRING,
  dosaje_etilico_cuantitativo STRING,
  vehiculo STRING,
  fecha DATE,
  mes INT,
  dia INT,
  hora STRING,
  clase_siniestro STRING,
  causa STRING,
  causa_especifica STRING,
  tipo_via STRING,
  codigo_carretera STRING,
  red_vial STRING
)
PARTITIONED BY (anio INT, departamento STRING, provincia STRING, distrito STRING)
STORED AS PARQUET
LOCATION '/data/curated/BBDD_ONSV_PERSONAS_2021_2023/';

-- d) ONSV VEHÍCULOS 2021–2023
CREATE EXTERNAL TABLE IF NOT EXISTS curated.onsv_vehiculos_pq (
  codigo_siniestro STRING,
  codigo_vehiculo STRING,
  situacion_vehiculo STRING,
  estado_modalidad STRING,
  modalidad_transporte STRING,
  elemento_transportado STRING,
  ambito_servicio STRING,
  posee_seguro STRING,
  estado_soat STRING,
  tipo_seguro STRING,
  compania_seguro STRING,
  posee_citv STRING,
  estado_citv STRING,
  lugar_impacto_vehiculo STRING,
  vehiculo STRING,
  tipo_siniestro STRING,
  fecha DATE,
  mes INT,
  dia INT,
  hora STRING,
  codigo_carretera STRING,
  tipo_via STRING
)
PARTITIONED BY (anio INT, departamento STRING, provincia STRING, distrito STRING)
STORED AS PARQUET
LOCATION '/data/curated/BBDD_ONSV_VEHICULOS_2021_2023/';

-- e) OSITRAN
CREATE EXTERNAL TABLE IF NOT EXISTS curated.ositran_pq (
  periodo STRING,
  concesion STRING,
  tramo STRING,
  fecha DATE,
  hora STRING,
  orden STRING,
  tipo_accidente STRING,
  causa STRING,
  tipo_via STRING,
  acciones_tomadas STRING,
  vehiculos_inv INT,
  personas_afectadas INT,
  latitud DOUBLE,
  longitud DOUBLE,
  nro INT
)
PARTITIONED BY (anio INT)
STORED AS PARQUET
LOCATION '/data/curated/OSITRAN/';

-- f) REPORTES PRELIMINARES
CREATE EXTERNAL TABLE IF NOT EXISTS curated.reportes_preliminares_pq (
  fecha_corte DATE,
  nro_reporte STRING,
  fecha_acc DATE,
  hora_acc STRING,
  modalidad_acc STRING,
  cant_fallecidos INT,
  cant_heridos INT,
  latitud DOUBLE,
  longitud DOUBLE,
  progresiva STRING,
  codigo_via STRING
)
PARTITIONED BY (departamento STRING, provincia STRING, distrito STRING)
STORED AS PARQUET
LOCATION '/data/curated/REPORTES_PRELIMINARES/';

-- g) ESTADÍSTICAS 2012–2018 (no particionada o por anio)
CREATE EXTERNAL TABLE IF NOT EXISTS curated.estadisticas_accidentes_pq (
  concepto STRING,
  cantidad INT
)
PARTITIONED BY (anio INT)
STORED AS PARQUET
LOCATION '/data/curated/ESTADISTICAS_ACCIDENTES_2012_2018/';

-- h) VÍCTIMAS FATALES 2012–2018 (por anio/dep)
CREATE EXTERNAL TABLE IF NOT EXISTS curated.victimas_fatales_pq (
  accidentes INT
)
PARTITIONED BY (anio INT, departamento STRING)
STORED AS PARQUET
LOCATION '/data/curated/VICTIMAS_FATALES_2012_2018/';
