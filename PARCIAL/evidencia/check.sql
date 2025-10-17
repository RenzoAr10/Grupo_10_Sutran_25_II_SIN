SHOW PARTITIONS curated.f_siniestros;

SELECT anio, COUNT(*) AS n_siniestros
FROM curated.f_siniestros
GROUP BY anio
ORDER BY anio;

SELECT *
FROM curated.f_siniestros
WHERE anio = (SELECT MIN(anio) FROM curated.f_siniestros)
LIMIT 10;
