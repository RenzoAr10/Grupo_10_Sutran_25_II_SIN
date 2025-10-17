
-- DTiempo
DROP TABLE IF EXISTS curated.d_tiempo;

CREATE EXTERNAL TABLE curated.d_tiempo (
  sk_fecha   INT,     -- yyyymmdd
  fecha      DATE,    -- DATE
  hora_hhmm  STRING   -- 'HH:mm' (texto)
)
STORED AS PARQUET
LOCATION '/data/curated/d_tiempo';

-- Carga: filas distintas de (fecha, hora) para no inflar la dim
INSERT OVERWRITE TABLE curated.d_tiempo
SELECT
  CAST(date_format(fecha_evento,'yyyyMMdd') AS INT) AS sk_fecha,
  fecha_evento AS fecha,
  hora_hhmm
FROM (
  SELECT DISTINCT fecha_evento, hora_hhmm
  FROM curated.v_siniestros_stg
  WHERE fecha_evento IS NOT NULL
) t;


-- D_Ubicacion (con lat/long)
DROP TABLE IF EXISTS curated.d_ubicacion;

CREATE EXTERNAL TABLE curated.d_ubicacion (
  sk_ubicacion  BIGINT,  -- surrogate determinístico (CRC32)
  departamento  STRING,
  provincia     STRING,
  distrito      STRING,
  latitud       DECIMAL(9,6),
  longitud      DECIMAL(9,6)
)
STORED AS PARQUET
LOCATION '/data/curated/d_ubicacion';

INSERT OVERWRITE TABLE curated.d_ubicacion
SELECT
  CAST(crc32(CONCAT_WS('|',
       COALESCE(departamento,''),
       COALESCE(provincia,''),
       COALESCE(distrito,''),
       COALESCE(CAST(latitud  AS STRING),''),
       COALESCE(CAST(longitud AS STRING),'')
  )) AS BIGINT)         AS sk_ubicacion,
  departamento, provincia, distrito, latitud, longitud
FROM (
  SELECT DISTINCT departamento, provincia, distrito, latitud, longitud
  FROM curated.v_siniestros_stg
) u;


-- D_Via
DROP TABLE IF EXISTS curated.d_via;

CREATE EXTERNAL TABLE curated.d_via (
  sk_via                     BIGINT,
  zona                       STRING,
  tipo_de_via                STRING,
  red_vial                   STRING,
  cod_carretera              STRING,
  caracteristicas_de_via     STRING,
  perfil_longitudinal_via    STRING,
  superficie_de_calzada      STRING,
  existe_senal_vertical      STRING,
  clasif_senal_vertical_n1   STRING,
  clasif_senal_vertical_n2   STRING,
  existe_senal_horizontal    STRING
)
STORED AS PARQUET
LOCATION '/data/curated/d_via';

INSERT OVERWRITE TABLE curated.d_via
SELECT
  CAST(crc32(CONCAT_WS('|',
    COALESCE(zona,''),
    COALESCE(tipo_de_via,''),
    COALESCE(red_vial,''),
    COALESCE(cod_carretera,''),
    COALESCE(caracteristicas_de_via,''),
    COALESCE(perfil_longitudinal_via,''),
    COALESCE(superficie_de_calzada,''),
    COALESCE(existe_senal_vertical,''),
    COALESCE(clasif_senal_vertical_n1,''),
    COALESCE(clasif_senal_vertical_n2,''),
    COALESCE(existe_senal_horizontal,'')
  )) AS BIGINT) AS sk_via,
  zona, tipo_de_via, red_vial, cod_carretera, caracteristicas_de_via,
  perfil_longitudinal_via, superficie_de_calzada,
  existe_senal_vertical, clasif_senal_vertical_n1, clasif_senal_vertical_n2,
  existe_senal_horizontal
FROM (
  SELECT DISTINCT zona, tipo_de_via, red_vial, cod_carretera, caracteristicas_de_via,
                  perfil_longitudinal_via, superficie_de_calzada,
                  existe_senal_vertical, clasif_senal_vertical_n1, clasif_senal_vertical_n2,
                  existe_senal_horizontal
  FROM curated.v_siniestros_stg
) v;

-- D_Clima
DROP TABLE IF EXISTS curated.d_clima;

CREATE EXTERNAL TABLE curated.d_clima (
  sk_clima            BIGINT,
  condicion_climatica STRING,
  zonificacion        STRING
)
STORED AS PARQUET
LOCATION '/data/curated/d_clima';

INSERT OVERWRITE TABLE curated.d_clima
SELECT
  CAST(crc32(CONCAT_WS('|',
    COALESCE(condicion_climatica,''),
    COALESCE(zonificacion,'')
  )) AS BIGINT) AS sk_clima,
  condicion_climatica, zonificacion
FROM (
  SELECT DISTINCT condicion_climatica, zonificacion
  FROM curated.v_siniestros_stg
) c;

-- D_Causa
DROP TABLE IF EXISTS curated.d_causa;

CREATE EXTERNAL TABLE curated.d_causa (
  sk_causa               BIGINT,
  causa_factor_principal STRING,
  causa_especifica       STRING
)
STORED AS PARQUET
LOCATION '/data/curated/d_causa';

INSERT OVERWRITE TABLE curated.d_causa
SELECT
  CAST(crc32(CONCAT_WS('|',
    COALESCE(causa_factor_principal,''),
    COALESCE(causa_especifica,'')
  )) AS BIGINT) AS sk_causa,
  causa_factor_principal, causa_especifica
FROM (
  SELECT DISTINCT causa_factor_principal, causa_especifica
  FROM curated.v_siniestros_stg
) k;

DROP TABLE IF EXISTS curated.f_siniestros;

CREATE EXTERNAL TABLE curated.f_siniestros (
  sk_fecha                INT,     -- yyyymmdd (consistente con D_Tiempo mínima)
  sk_ubicacion            BIGINT,
  sk_via                  BIGINT,
  sk_clima                BIGINT,
  sk_causa                BIGINT,

  cant_fallecidos         INT,
  cant_lesionados         INT,
  cant_vehiculos_danados  INT,

  codigo_siniestro        STRING,
  fecha_evento            DATE,
  hora_hhmm               STRING
)
PARTITIONED BY (anio INT)
STORED AS PARQUET
LOCATION '/data/curated/f_siniestros';

-- Particionado dinámico
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE curated.f_siniestros PARTITION (anio)
SELECT
  -- sk_fecha (yyyymmdd) consistente con D_Tiempo
  CAST(date_format(fecha_evento,'yyyyMMdd') AS INT) AS sk_fecha,

  -- sk_ubicacion
  CAST(crc32(CONCAT_WS('|',
       COALESCE(departamento,''),
       COALESCE(provincia,''),
       COALESCE(distrito,''),
       COALESCE(CAST(latitud  AS STRING),''),
       COALESCE(CAST(longitud AS STRING),'')
  )) AS BIGINT) AS sk_ubicacion,

  -- sk_via
  CAST(crc32(CONCAT_WS('|',
    COALESCE(zona,''),
    COALESCE(tipo_de_via,''),
    COALESCE(red_vial,''),
    COALESCE(cod_carretera,''),
    COALESCE(caracteristicas_de_via,''),
    COALESCE(perfil_longitudinal_via,''),
    COALESCE(superficie_de_calzada,''),
    COALESCE(existe_senal_vertical,''),
    COALESCE(clasif_senal_vertical_n1,''),
    COALESCE(clasif_senal_vertical_n2,''),
    COALESCE(existe_senal_horizontal,'')
  )) AS BIGINT) AS sk_via,

  -- sk_clima
  CAST(crc32(CONCAT_WS('|',
    COALESCE(condicion_climatica,''),
    COALESCE(zonificacion,'')
  )) AS BIGINT) AS sk_clima,

  -- sk_causa
  CAST(crc32(CONCAT_WS('|',
    COALESCE(causa_factor_principal,''),
    COALESCE(causa_especifica,'')
  )) AS BIGINT) AS sk_causa,

  -- Métricas
  cant_fallecidos,
  cant_lesionados,
  cant_vehiculos_danados,

  -- Auditoría
  codigo_siniestro,
  fecha_evento,
  hora_hhmm,

  -- Partición
  YEAR(fecha_evento) AS anio
FROM curated.v_siniestros_stg
WHERE fecha_evento IS NOT NULL;

