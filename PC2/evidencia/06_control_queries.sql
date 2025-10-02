-- Estas son las consultas básicas que realizamos seún los primeros datasets que ingestamos
USE raw;

-- Conteos
SELECT COUNT(*) AS filas_sutran FROM raw.sutran_accidentes_2020_2021;
SELECT COUNT(*) AS filas_estad  FROM raw.estadisticas_accidentes_2012_2018;
SELECT COUNT(*) AS filas_vict   FROM raw.victimas_fatales_2012_2018;

-- Muestras
SELECT * FROM raw.sutran_accidentes_2020_2021 LIMIT 10;
SELECT * FROM raw.estadisticas_accidentes_2012_2018 LIMIT 10;
SELECT * FROM raw.victimas_fatales_2012_2018 LIMIT 10;

-- Top 10 (ejemplo solicitado en la práctica)
SELECT departamento, SUM(fallecidos) AS total_fallecidos
FROM raw.sutran_accidentes_2020_2021
GROUP BY departamento
ORDER BY total_fallecidos DESC
LIMIT 10;

-- No se borran los datos, ya que Hive solo copia la estructura de la tabla creada y apunta hacia donde están los datos almacenados
DROP TABLE IF EXISTS raw.sutran_accidentes_2020_2021;
DROP TABLE IF EXISTS raw.estadisticas_accidentes_2012_2018;
DROP TABLE IF EXISTS raw.victimas_fatales_2012_2018;
