CREATE DATABASE IF NOT EXISTS raw;
USE raw;

-- De la SUTRAN – Accidentes en carreteras 2020–2021
CREATE EXTERNAL TABLE IF NOT EXISTS raw.sutran_accidentes_2020_2021 (
  fecha_corte   STRING,
  fecha         STRING,
  hora          STRING,
  departamento  STRING,
  codigo_via    STRING,
  kilometro     STRING,
  modalidad     STRING,
  fallecidos    INT,
  heridos       INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",        -- El delimitador
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
)
STORED AS TEXTFILE
LOCATION '/data/raw/sutran_accidentes_2020_2021/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- b) Estadísticas 2012–2018 (concepto–año–cantidad)
CREATE EXTERNAL TABLE IF NOT EXISTS raw.estadisticas_accidentes_2012_2018 (
  concepto STRING,
  anio     INT,
  cantidad INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
)
STORED AS TEXTFILE
LOCATION '/data/raw/estadisticas_accidentes_2012_2018/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Víctimas fatales 2012–2018 por departamento
CREATE EXTERNAL TABLE IF NOT EXISTS raw.victimas_fatales_2012_2018 (
  departamento STRING,
  anio         INT,
  accidentes   INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = "\"",
  "escapeChar"    = "\\"
)
STORED AS TEXTFILE
LOCATION '/data/raw/victimas_fatales_2012_2018/'
TBLPROPERTIES ("skip.header.line.count"="1");
