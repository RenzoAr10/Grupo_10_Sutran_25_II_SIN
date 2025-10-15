-- Para inicializar
-- beeline -u "jdbc:hive2://localhost:10000/default" -n maria_dev

CREATE DATABASE IF NOT EXISTS raw;
USE raw;

--2.1 ONSV – PERSONAS 2021–2023
CREATE EXTERNAL TABLE raw.onsv_personas_2021_2023 (
  codigo_siniestro STRING,
  codigo_vehiculo STRING,
  codigo_persona STRING,
  departamento STRING,
  provincia STRING,
  distrito STRING,
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
  dosaje_etilico_cualitativo STRING,        -- ¿se sometió? (Sí/No)
  resultado_dosaje_cualitativo STRING,
  dosaje_etilico_cuantitativo STRING,       -- ¿se sometió? (Sí/No)
  vehiculo STRING,
  fecha STRING,
  anio INT,
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
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/BBDD_ONSV_PERSONAS_2021_2023/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- 2.2 ONSV – SINIESTROS 2021–2023
CREATE EXTERNAL TABLE raw.onsv_siniestros_2021_2023 (
  codigo_siniestro STRING,
  fecha_siniestro STRING,
  hora_siniestro STRING,
  clase_siniestro STRING,
  cant_fallecidos INT,
  cant_lesionados INT,
  cant_vehiculos_danados INT,
  departamento STRING,
  provincia STRING,
  distrito STRING,
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
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/BBDD_ONSV_SINIESTROS_2021_2023/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- 2.3 ONSV – VEHÍCULOS 2021–2023
CREATE EXTERNAL TABLE raw.onsv_vehiculos_2021_2023 (
  codigo_siniestro STRING,
  codigo_vehiculo STRING,
  departamento STRING,
  provincia STRING,
  distrito STRING,
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
  fecha STRING,
  anio INT,
  mes INT,
  dia INT,
  hora STRING,
  codigo_carretera STRING,
  tipo_via STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/BBDD_ONSV_VEHICULOS_2021_2023/'
TBLPROPERTIES ("skip.header.line.count"="1");

--2.4 ESTADÍSTICAS 2012–2018
CREATE EXTERNAL TABLE raw.estadisticas_accidentes_2012_2018 (
  concepto STRING,
  anio INT,
  cantidad INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/ESTADISTICAS_ACCIDENTES_2012_2018/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- 2.5 OSITRAN
CREATE EXTERNAL TABLE raw.ositran (
  anio INT,
  periodo STRING,
  concesion STRING,
  tramo STRING,
  fecha STRING,
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
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/OSITRAN/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- 2.6 REPORTES PRELIMINARES
CREATE EXTERNAL TABLE raw.reportes_preliminares (
  fecha_corte STRING,
  nro_reporte STRING,
  fecha_acc STRING,
  hora_acc STRING,
  modalidad_acc STRING,
  cant_fallecidos INT,
  cant_heridos INT,
  latitud DOUBLE,
  longitud DOUBLE,
  progresiva STRING,
  codigo_via STRING,
  departamento STRING,
  provincia STRING,
  distrito STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/REPORTES_PRELIMINARES/'
TBLPROPERTIES ("skip.header.line.count"="1");

--2.7 SUTRAN – Accidentes 2020–2021
CREATE EXTERNAL TABLE raw.sutran_accidentes_2020_2021 (
  fecha_corte STRING,
  fecha STRING,
  hora STRING,
  departamento STRING,
  codigo_via STRING,
  kilometro STRING,
  modalidad STRING,
  fallecidos INT,
  heridos INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/SUTRAN_ACCIDENTES_2020_2021/'
TBLPROPERTIES ("skip.header.line.count"="1");

--2.8 Víctimas fatales 2012–2018
CREATE EXTERNAL TABLE raw.victimas_fatales_2012_2018 (
  departamento STRING,
  anio INT,
  accidentes INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar"=",","quoteChar"="\","escapeChar"="\\")
STORED AS TEXTFILE
LOCATION '/data/raw/VICTIMAS_FATALES_2012_2018/'
TBLPROPERTIES ("skip.header.line.count"="1");


