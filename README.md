Acá podrá ver los pasos y comandos utilizados para implementar y verificar la arquitectura base de **Hadoop & Spark** dentro de **Hortonworks Sandbox 2.6.5** sobre **VirtualBox**.

**Curso:** Sistemas de Inteligencia de Negocios (SI807U)
**Profesor:** Dr. Ing. Hilario Aradiel Castaneda
**Ciclo:** 2025–2
**Entorno:** Hortonworks Sandbox (HDP 2.6.5 – VirtualBox)
**Grupo 10 – Caso:** *Superintendencia de Transporte Terrestre de Personas, Carga y Mercancías (SUTRAN)*

## 1. Requisitos previos

| Requisito        | Detalle                                                |
| ---------------- | ------------------------------------------------------ |
| **Sistema Host** | Windows 10 / 11 (64 bits)                              |
| **VirtualBox**   | Versión 7.0 o superior                                 |
| **Archivo OVA**  | `HDP_2.6.5_virtualbox_180626.ova`                      |
| **RAM asignada** | 8 – 12 GB                                              |
| **CPU asignada** | 4 núcleos                                              |
| **Red**          | Adaptador 1: NAT  ·  Adaptador 2: Host-Only (opcional) |

---

## 2. Importar la máquina virtual

1. Abrir VirtualBox → **Archivo > Importar servicio virtualizado**.
2. Seleccionar el archivo OVA de Hortonworks.
3. Asignar recursos → 4 vCPU, 8–12 GB RAM.
4. Finalizar y esperar a que termine la importación.

---

## 3. Configuración de red en VirtualBox

1. Seleccionar la VM → **Configuración > Red**.
2. **Adaptador 1:** NAT (permite salida a Internet).
3. **Adaptador 2:** Host-Only Adapter (opcional, para acceso local).
4. Guardar los cambios.

---

## 4. Primer arranque de la VM

1. Iniciar la VM **HDP Sandbox** desde VirtualBox.
2. Esperar de 15 a 20 minutos en el primer inicio.
3. Una vez arrancado, verificar que muestra en pantalla los puertos de acceso:

   * Ambari → `http://localhost:1080`
   * WebShell → `http://localhost:4200`

---

## 5. Accesos principales

| Servicio            | URL / Acceso                                   | Usuario     | Contraseña                 |
| ------------------- | ---------------------------------------------- | ----------- | -------------------------- |
| **Ambari**          | [http://localhost:1080](http://localhost:1080) | `admin`     | `admin` (puede resetearse) |
| **WebShell Client** | [http://localhost:4200](http://localhost:4200) | `root`      | `hadoop`                   |
| **Hive**            | se abre con comando `hive` dentro de la VM     | `maria_dev` | `maria_dev`                |
| **Spark**           | se abre con comando `spark-shell`              | —           | —                          |

---

## 6. Cambio de contraseñas (recomendado)

```bash
# Dentro del WebShell (usuario root)
passwd root
passwd maria_dev

# Reinicio de contraseña de Ambari (usuario admin)
ambari-admin-password-reset
```

---

## 7. Verificación del sistema de archivos HDFS

```bash
# Listar el directorio raíz
hdfs dfs -ls /

# Crear carpetas base (opcional)
hdfs dfs -mkdir -p /data/raw
hdfs dfs -mkdir -p /data/curated
hdfs dfs -ls /data
```

> Si estos comandos muestran directorios y no errores, el servicio **HDFS** está activo.

---

## 8. Inicialización de Hive

```bash
# Abrir el cliente de Hive
hive
```

> Esperar a que cargue el CLI y aparezca el prompt:

```
hive>
```

Para salir:

```sql
exit;
```

> Con esta verificación se confirma que HiveServer2 está operativo.

---

## 9. Inicialización de Spark

```bash
# Comprobar versión y logo (sin abrir consola interactiva)
spark-shell --version
```

> Debe mostrarse el logo de Spark y su versión (ej. Spark 2.3.0).

Para ingresar al entorno interactivo:

```bash
spark-shell
```

> Al iniciar correctamente, aparecerá el prompt:

```
scala>
```

Para salir del REPL de Scala:

```scala
:quit
```

---

## 10. Apagado limpio del entorno

Antes de cerrar VirtualBox, ejecutar en la consola:

```bash
poweroff
```

> Esto apaga el sistema correctamente y evita corrupción de la VM.

# Ingesta de Datos en Hortonworks (SUTRAN – SI807U)

Aca se immplementa la primera ingesta de datos en Hortonworks, abarcando:

* Carga de datasets CSV a **HDFS** (zona *raw*).
* Creación de **tablas externas en Hive** para la zona *raw*.
* Consultas de control y verificación de la carga.
* Estructura de base para la zona *curated* (formato Parquet).

---

## 1. Configuración del entorno

### 1.1. Acceso a la VM

Iniciar la máquina virtual desde VirtualBox y verificar acceso:

```bash
http://localhost:1080   # Interfaz principal del sandbox
http://localhost:8080   # Ambari (panel de servicios)
http://localhost:4200   # Web Shell (root/hadoop)
```

Usuario y contraseña por defecto o lo que se configuró al inicio:

```bash
Usuario: root
Contraseña: contra
```

Verificar los servicios principales desde **Ambari** (que esten verdes):

* HDFS
* Hive
* Spark
* YARN

---

## 2. Ingesta de archivos a HDFS

### 2.1. Subida desde Windows a la VM

En PowerShell (en el host), subir los archivos CSV al sandbox usando `pscp`:

```bash
# Opción con Aspera (ascp)
ascp -P 2222 "C:\Users\jairo\Documents\datasets_sutran\*.csv" root@127.0.0.1:/opt/datasets/

# Usando scp si no se tiene ascp (Este fue el usado)
scp -P 2222 "C:\Users\jairo\Documents\datasets_sutran\*.csv" root@127.0.0.1:/opt/datasets/
```

Este comando transfiere todos los `.csv` desde la carpeta local a la ruta `/opt/datasets/` dentro de la VM.

### 2.2. Creación de carpetas en HDFS

Dentro del Web Shell del sandbox:

```bash
su - hdfs
hdfs dfs -mkdir -p /data/raw
hdfs dfs -mkdir -p /data/curated
hdfs dfs -mkdir -p /data/tmp
hdfs dfs -chmod -R 775 /data
exit
```

Verificar estructura creada:

```bash
hdfs dfs -ls -h /data
```

### 2.3 LIMPIEZA CON PYSPARK

LUEGO DE SUBIR LOS CSV PRINCIPALES A LA VM, exactamente a la carpeta /data/raw creada posteriormente
![image.png](/images/image7.png)

PROCEDEMOS CON LA LIMPIEZA USANDO SPARK

```bash
#INICIAMOS
pyspark
```

- LIMPIAMOS PARA CSV DE PERSONAS
    
    ```python
    
    from pyspark.sql import SparkSession
    from pyspark.sql.functions import col
    
    spark = SparkSession.builder.appName("CleanCSV").getOrCreate()
    
    # Leer CSV original desde HDFS (con BOM y codificación especial)
    personas = spark.read.option("header", "true") \
        .option("multiLine", "true") \
        .option("encoding", "ISO-8859-1") \
        .csv("/data/raw/personas/BBDD_ONSV-PERSONAS_2021-2023.csv")
    
    # Eliminar caracteres invisibles (como BOM)
    cols = [col(c).alias(c.strip().replace("ï»¿", "").replace("\ufeff", "")) for c in personas.columns]
    personas_clean = personas.select(*cols)
    
    # Guardar versión limpia en otra carpeta en formato CSV (puedes usar Parquet si prefieres)
    personas_clean.write \
        .option("header", "true") \
        .mode("overwrite") \
        .csv("/data/clean/personas")
    
    ```
    
- LIMPIAMOS PARA VEHÍCULOS
    
    ```python
    vehiculos = spark.read.option("header", "true") \
        .option("encoding", "ISO-8859-1") \
        .csv("/data/raw/vehiculos/BBDD_ONSV-VEHICULOS_2021-2023.csv")
    
    cols = [col(c).alias(c.strip().replace("ï»¿", "").replace("\ufeff", "")) for c in vehiculos.columns]
    vehiculos_clean = vehiculos.select(*cols)
    
    vehiculos_clean.write.option("header", "true").mode("overwrite").csv("/data/clean/vehiculos")
    
    ```
    
- LIMPIAMOS PARA SINIESTROS
    
    ```python
    siniestros = spark.read.option("header", "true") \
        .option("encoding", "ISO-8859-1") \
        .csv("/data/raw/siniestros/BBDD_ONSV-SINIESTROS_2021-2023.csv")
    
    cols = [col(c).alias(c.strip().replace("ï»¿", "").replace("\ufeff", "")) for c in siniestros.columns]
    siniestros_clean = siniestros.select(*cols)
    
    siniestros_clean.write.option("header", "true").mode("overwrite").csv("/data/clean/siniestros")
    
    ```
    
- LIMPIEZA EXTRA
    
    Si quiero simplificar el proceso y no depender del formato, podemos limpiar las fechas en Spark y guardarlas ya en formato yyyy-MM-dd antes de cargar a Hive, así ya no tendríamos que usar unix_timestamp() nunca más. (NO SE USO)
    
    ```sql
    from pyspark.sql.functions import to_date
    
    df = spark.read.option("header", "true").csv("/data/clean/siniestros")
    df = df.withColumn("FECHA_SINIESTRO", to_date("FECHA_SINIESTRO", "dd/MM/yyyy"))
    df.write.mode("overwrite").parquet("/data/parquet/siniestros")
    
    ```
    
    Correción en PySpark para siniestros (SI SE USO)
    
    ```sql
    from pyspark.sql.functions import col
    
    df = spark.read.option("header", "true").csv("/data/clean/siniestros")
    
    df = df.withColumn("CANTIDAD_DE_FALLECIDOS", col("CANTIDAD_DE_FALLECIDOS").cast("int")) \
           .withColumn("CANTIDAD_DE_LESIONADOS", col("CANTIDAD_DE_LESIONADOS").cast("int")) \
           .withColumn("CANTIDAD_DE_VEHICULOS_DANADOS", col("CANTIDAD_DE_VEHICULOS_DANADOS").cast("int"))
    
    df.write.mode("overwrite").parquet("/data/parquet/siniestros")
    
    ```
    

VERIFICAMOS DESDE HDFS:

```bash
hdfs dfs -ls /data/clean/personas
```

### 2.4 CREACIÓN DE TABLAS EXTERNAS RAW

Direcciones que se usaran:

/data/clean/personas/
/data/clean/vehiculos/
/data/clean/siniestros/

```sql
#Iniciamos
hive

#Crear base de datos
CREATE DATABASE IF NOT EXISTS ons_vial_raw;
USE ons_vial_raw;
```

- TABLA EXTERNA: personas
    
    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS ons_vial_raw.personas_raw (
      CODIGO_SINIESTRO STRING,
      CODIGO_VEHICULO STRING,
      CODIGO_PERSONA STRING,
      DEPARTAMENTO STRING,
      PROVINCIA STRING,
      DISTRITO STRING,
      TIPO_PERSONA STRING,
      GRAVEDAD STRING,
      LUGAR_ATENCION_LESIONADO STRING,
      LUGAR_DE_DEFUNCION STRING,
      SITUACION_DE_PERSONA STRING,
      PAIS_DE_NACIONALIDAD STRING,
      EDAD STRING,
      SEXO STRING,
      POSEE_LICENCIA STRING,
      ESTADO_LICENCIA STRING,
      CLASE_LICENCIA STRING,
      SE_SOMETIO_A_DOSAJE_ETILICO_CUALITATIVO STRING,
      RESULTADO_DEL_DOSAJE_ETILICO_CUALITATIVO STRING,
      SE_SOMETIO_A_DOSAJE_ETILICO_CUANTITATIVO STRING,
      VEHICULO STRING,
      FECHA STRING,
      ANIO STRING,
      MES STRING,
      DIA STRING,
      HORA STRING,
      CLASE_DE_SINIESTRO STRING,
      CAUSA STRING,
      CAUSA_ESPECIFICA STRING,
      TIPO_DE_VIA STRING,
      CODIGO_DE_CARRETERA STRING,
      RED_VIAL STRING
    )
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    LOCATION '/data/clean/personas'
    TBLPROPERTIES ("skip.header.line.count"="1");
    
    ```
    
- TABLA EXTERNA: vehiculos
    
    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS ons_vial_raw.vehiculos_raw (
      CODIGO_SINIESTRO STRING,
      CODIGO_VEHICULO STRING,
      DEPARTAMENTO STRING,
      PROVINCIA STRING,
      DISTRITO STRING,
      SITUACION_VEHICULO STRING,
      ESTADO_MODALIDAD STRING,
      MODALIDAD_DE_TRANSPORTE STRING,
      ELEMENTO_TRANSPORTADO STRING,
      AMBITO_SERVICIO STRING,
      POSEE_SEGURO STRING,
      ESTADO_SOAT STRING,
      TIPO_SEGURO STRING,
      COMPANIA_SEGURO STRING,
      POSEE_CITV STRING,
      ESTADO_CITV STRING,
      LUGAR_IMPACTO_VEHICULO STRING,
      VEHICULO STRING,
      TIPO_SINIESTRO STRING,
      FECHA STRING,
      ANO STRING,
      MES STRING,
      DIA STRING,
      HORA STRING,
      CODIGO_DE_CARRETERA STRING,
      TIPO_DE_VIA STRING
    )
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    LOCATION '/data/clean/vehiculos'
    TBLPROPERTIES ("skip.header.line.count"="1");
    
    ```
    
- TABLA EXTERNA: siniestros
    
    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS ons_vial_raw.siniestros_raw (
      CODIGO_SINIESTRO STRING,
      FECHA_SINIESTRO STRING,
      HORA_SINIESTRO STRING,
      CLASE_SINIESTRO STRING,
      CANTIDAD_DE_FALLECIDOS INT,
      CANTIDAD_DE_LESIONADOS INT,
      CANTIDAD_DE_VEHICULOS_DANADOS INT,
      DEPARTAMENTO STRING,
      PROVINCIA STRING,
      DISTRITO STRING,
      ZONA STRING,
      TIPO_DE_VIA STRING,
      RED_VIAL STRING,
      COD_CARRETERA STRING,
      EXISTE_CICLOVIA STRING,
      COORDENADAS_LATITUD STRING,
      COORDENADAS_LONGITUD STRING,
      CONDICION_CLIMATICA STRING,
      ZONIFICACION STRING,
      CARACTERISTICAS_DE_VIA STRING,
      PERFIL_LONGITUDINAL_VIA STRING,
      SUPERFICIE_DE_CALZADA STRING,
      EXISTE_SENAL_VERTICAL STRING,
      CLASIFICACION_DE_LA_SENAL_VERTICAL_N_1 STRING,
      CLASIFICACION_DE_LA_SENAL_VERTICAL_N_2 STRING,
      EXISTE_SENAL_HORIZONTAL STRING,
      CAUSA_FACTOR_PRINCIPAL STRING,
      CAUSA_ESPECIFICA STRING
    )
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    LOCATION '/data/clean/siniestros'
    TBLPROPERTIES ("skip.header.line.count"="1");
    
    ```
    
### 2.5 TRANSFORMAMOS A PARQUET CON PYSPARK

1. Convertir personas CSV limpio a Parquet
    
    ```sql
    df = spark.read.option("header", "true").csv("/data/clean/personas")
    df.write.mode("overwrite").parquet("/data/parquet/personas")
    ```
    
2. Convertir vehiculos a CSV limpio a Parquet
    
    ```sql
    df = spark.read.option("header", "true").csv("/data/clean/vehiculos")
    df.write.mode("overwrite").parquet("/data/parquet/vehiculos")
    ```
    
3. Convertir siniestros a CSV limpio a Parquet
    
    ```sql
    df = spark.read.option("header", "true").csv("/data/clean/siniestros")
    df.write.mode("overwrite").parquet("/data/parquet/siniestros")
    ```
    

LO QUE SE ESPERA QUE SE CREE

/data/parquet/personas/
/data/parquet/vehiculos/
/data/parquet/siniestros/

### 2.7 CREAMOS LAS TABLAS EXTERNAS EN HIVE

```sql
hive
CREATE DATABASE IF NOT EXISTS ons_vial_raw;
USE ons_vial_raw;
```

- TABLA EXTERNA: `personas_parquet`
    
    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS personas_parquet (
      CODIGO_SINIESTRO STRING,
      CODIGO_VEHICULO STRING,
      CODIGO_PERSONA STRING,
      DEPARTAMENTO STRING,
      PROVINCIA STRING,
      DISTRITO STRING,
      TIPO_PERSONA STRING,
      GRAVEDAD STRING,
      LUGAR_ATENCION_LESIONADO STRING,
      LUGAR_DE_DEFUNCION STRING,
      SITUACION_DE_PERSONA STRING,
      PAIS_DE_NACIONALIDAD STRING,
      EDAD STRING,
      SEXO STRING,
      POSEE_LICENCIA STRING,
      ESTADO_LICENCIA STRING,
      CLASE_LICENCIA STRING,
      SE_SOMETIO_A_DOSAJE_ETILICO_CUALITATIVO STRING,
      RESULTADO_DEL_DOSAJE_ETILICO_CUALITATIVO STRING,
      SE_SOMETIO_A_DOSAJE_ETILICO_CUANTITATIVO STRING,
      VEHICULO STRING,
      FECHA STRING,
      ANIO STRING,
      MES STRING,
      DIA STRING,
      HORA STRING,
      CLASE_DE_SINIESTRO STRING,
      CAUSA STRING,
      CAUSA_ESPECIFICA STRING,
      TIPO_DE_VIA STRING,
      CODIGO_DE_CARRETERA STRING,
      RED_VIAL STRING
    )
    STORED AS PARQUET
    LOCATION '/data/parquet/personas';
    
    ```
    
- TABLA EXTERNA: `vehiculos_parquet`
    
    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS vehiculos_parquet (
      CODIGO_SINIESTRO STRING,
      CODIGO_VEHICULO STRING,
      DEPARTAMENTO STRING,
      PROVINCIA STRING,
      DISTRITO STRING,
      SITUACION_VEHICULO STRING,
      ESTADO_MODALIDAD STRING,
      MODALIDAD_DE_TRANSPORTE STRING,
      ELEMENTO_TRANSPORTADO STRING,
      AMBITO_SERVICIO STRING,
      POSEE_SEGURO STRING,
      ESTADO_SOAT STRING,
      TIPO_SEGURO STRING,
      COMPANIA_SEGURO STRING,
      POSEE_CITV STRING,
      ESTADO_CITV STRING,
      LUGAR_IMPACTO_VEHICULO STRING,
      VEHICULO STRING,
      TIPO_SINIESTRO STRING,
      FECHA STRING,
      ANO STRING,
      MES STRING,
      DIA STRING,
      HORA STRING,
      CODIGO_DE_CARRETERA STRING,
      TIPO_DE_VIA STRING
    )
    STORED AS PARQUET
    LOCATION '/data/parquet/vehiculos';
    
    ```
    
- TABLA EXTERNA: `siniestros_parquet`
    
    ```sql
    CREATE EXTERNAL TABLE IF NOT EXISTS siniestros_parquet (
      CODIGO_SINIESTRO STRING,
      FECHA_SINIESTRO STRING,
      HORA_SINIESTRO STRING,
      CLASE_SINIESTRO STRING,
      CANTIDAD_DE_FALLECIDOS INT,
      CANTIDAD_DE_LESIONADOS INT,
      CANTIDAD_DE_VEHICULOS_DANADOS INT,
      DEPARTAMENTO STRING,
      PROVINCIA STRING,
      DISTRITO STRING,
      ZONA STRING,
      TIPO_DE_VIA STRING,
      RED_VIAL STRING,
      COD_CARRETERA STRING,
      EXISTE_CICLOVIA STRING,
      COORDENADAS_LATITUD STRING,
      COORDENADAS_LONGITUD STRING,
      CONDICION_CLIMATICA STRING,
      ZONIFICACION STRING,
      CARACTERISTICAS_DE_VIA STRING,
      PERFIL_LONGITUDINAL_VIA STRING,
      SUPERFICIE_DE_CALZADA STRING,
      EXISTE_SENAL_VERTICAL STRING,
      CLASIFICACION_DE_LA_SENAL_VERTICAL_N_1 STRING,
      CLASIFICACION_DE_LA_SENAL_VERTICAL_N_2 STRING,
      EXISTE_SENAL_HORIZONTAL STRING,
      CAUSA_FACTOR_PRINCIPAL STRING,
      CAUSA_ESPECIFICA STRING
    )
    STORED AS PARQUET
    LOCATION '/data/parquet/siniestros';
    
    ```
    

## 3. CREACIÓN DE MODELO ESTRELLA

### 3.1 Esquema estrella: resumen

El hecho principal es **`f_siniestro`**, con las siguientes dimensiones:

1. `dim_tiempo` 
2. `dim_persona`
3. `dim_vehiculo`
4. `dim_tipo_via`
5. `dim_ubicacion`

### 3.2. Creación de Tablas

- CREAR TABLA dim_tiempo
    
    ```sql
    CREATE TABLE dim_tiempo (
      id_tiempo INT,
      fecha DATE,
      ano INT,
      mes STRING,
      dia STRING
    )
    STORED AS PARQUET;
    
    ```
    
    ```sql
    INSERT OVERWRITE TABLE dim_tiempo
    SELECT
      ROW_NUMBER() OVER (ORDER BY fecha_siniestro) AS id_tiempo,
      TO_DATE(fecha_siniestro, 'dd/MM/yyyy') AS fecha,
      YEAR(TO_DATE(fecha_siniestro, 'dd/MM/yyyy')) AS ano,
      MONTH(TO_DATE(fecha_siniestro, 'dd/MM/yyyy')) AS mes,
      DAY(TO_DATE(fecha_siniestro, 'dd/MM/yyyy')) AS dia
    FROM (
      SELECT DISTINCT fecha_siniestro
      FROM siniestros_parquet
      WHERE fecha_siniestro IS NOT NULL
    ) t;
    
    INSERT OVERWRITE TABLE dim_tiempo
    SELECT
      ROW_NUMBER() OVER (ORDER BY fecha_siniestro) AS id_tiempo,
      TO_DATE(FROM_UNIXTIME(UNIX_TIMESTAMP(fecha_siniestro, 'dd/MM/yyyy'))) AS fecha,
      YEAR(FROM_UNIXTIME(UNIX_TIMESTAMP(fecha_siniestro, 'dd/MM/yyyy'))) AS ano,
      MONTH(FROM_UNIXTIME(UNIX_TIMESTAMP(fecha_siniestro, 'dd/MM/yyyy'))) AS mes,
      DAY(FROM_UNIXTIME(UNIX_TIMESTAMP(fecha_siniestro, 'dd/MM/yyyy'))) AS dia
    FROM (
      SELECT DISTINCT fecha_siniestro
      FROM siniestros_parquet
      WHERE fecha_siniestro IS NOT NULL
    ) t;
    
    ```
    
- CREAR TABLA dim_persona
    
    ```sql
    CREATE TABLE dim_persona (
      codigo_persona STRING,
      tipo_persona STRING,
      gravedad STRING,
      edad STRING,
      sexo STRING,
      posee_licencia STRING,
      clase_licencia STRING,
      resultado_dosaje STRING,
      situacion_de_persona STRING,
      pais_de_nacionalidad STRING
    )
    STORED AS PARQUET;
    
    INSERT OVERWRITE TABLE dim_persona
    SELECT DISTINCT
      codigo_persona,
      tipo_persona,
      gravedad,
      edad,
      sexo,
      posee_licencia,
      clase_licencia,
      resultado_del_dosaje_etilico_cualitativo AS resultado_dosaje,
      situacion_de_persona,
      pais_de_nacionalidad
    FROM personas_parquet
    WHERE codigo_persona IS NOT NULL;
    
    ```
    
- CREAR TABLA dim_vehiculo
    
    ```sql
    CREATE TABLE dim_vehiculo (
      codigo_vehiculo STRING,
      vehiculo STRING,
      modalidad_de_transporte STRING,
      estado_modalidad STRING,
      situacion_vehiculo STRING,
      estado_soat STRING,
      tipo_seguro STRING,
      compania_seguro STRING,
      estado_citv STRING
    )
    STORED AS PARQUET;
    
    INSERT OVERWRITE TABLE dim_vehiculo
    SELECT DISTINCT
      codigo_vehiculo,
      vehiculo,
      modalidad_de_transporte,
      estado_modalidad,
      situacion_vehiculo,
      estado_soat,
      tipo_seguro,
      compania_seguro,
      estado_citv
    FROM vehiculos_parquet
    WHERE codigo_vehiculo IS NOT NULL;
    
    ```
    
- CREAR TABLA: dim_tipo_via
    
    ```sql
    CREATE TABLE dim_tipo_via (
      id_tipo_via INT,
      tipo_de_via STRING,
      perfil_longitudinal_via STRING,
      superficie_de_calzada STRING,
      zonificacion STRING
    )
    STORED AS PARQUET;
    
    INSERT OVERWRITE TABLE dim_tipo_via
    SELECT
      ROW_NUMBER() OVER (ORDER BY tipo_de_via) AS id_tipo_via,
      tipo_de_via,
      perfil_longitudinal_via,
      superficie_de_calzada,
      zonificacion
    FROM (
      SELECT DISTINCT
        tipo_de_via,
        perfil_longitudinal_via,
        superficie_de_calzada,
        zonificacion
      FROM siniestros_parquet
      WHERE tipo_de_via IS NOT NULL
    ) t;
    
    ```
    
- CREAR TABLA: f_siniestro
    
    ```sql
    CREATE TABLE f_siniestro (
      codigo_siniestro STRING,
      id_tiempo INT,
      id_tipo_via INT,
      codigo_vehiculo STRING,
      codigo_persona STRING,
      clase_siniestro STRING,
      cantidad_de_fallecidos INT,
      cantidad_de_lesionados INT,
      cantidad_de_vehiculos_danados INT,
      causa_factor_principal STRING,
      coordenadas_latitud STRING,
      coordenadas_longitud STRING
    )
    STORED AS PARQUET;
    
    INSERT OVERWRITE TABLE f_siniestro
    SELECT
      s.codigo_siniestro,
      t.id_tiempo,
      v.id_tipo_via,
      p.codigo_vehiculo,
      p.codigo_persona,
      s.clase_siniestro,
      s.cantidad_de_fallecidos,
      s.cantidad_de_lesionados,
      s.cantidad_de_vehiculos_danados,
      s.causa_factor_principal,
      s.coordenadas_latitud,
      s.coordenadas_longitud
    FROM siniestros_parquet s
    LEFT JOIN (
      SELECT DISTINCT codigo_siniestro, codigo_vehiculo, codigo_persona, fecha
      FROM personas_parquet
    ) p ON s.codigo_siniestro = p.codigo_siniestro
    LEFT JOIN dim_tiempo t
      ON TO_DATE(FROM_UNIXTIME(UNIX_TIMESTAMP(s.fecha_siniestro, 'dd/MM/yyyy'))) = t.fecha
    LEFT JOIN dim_tipo_via v
      ON s.tipo_de_via = v.tipo_de_via
      AND s.perfil_longitudinal_via = v.perfil_longitudinal_via
      AND s.superficie_de_calzada = v.superficie_de_calzada
      AND s.zonificacion = v.zonificacion;
    
    ```
    

## 4. CONSULTAS DE PRUEBA

```sql
-- Total de siniestros por tipo
SELECT clase_siniestro, COUNT(*) AS total
FROM f_siniestro
GROUP BY clase_siniestro
ORDER BY total DESC;

-- Fallecidos por tipo de vía
SELECT tv.tipo_de_via, SUM(fs.cantidad_de_fallecidos) AS total_fallecidos
FROM f_siniestro fs
JOIN dim_tipo_via tv ON fs.id_tipo_via = tv.id_tipo_via
GROUP BY tv.tipo_de_via
ORDER BY total_fallecidos DESC;

-- Lesionados por año
SELECT t.ano, SUM(fs.cantidad_de_lesionados) AS lesionados
FROM f_siniestro fs
JOIN dim_tiempo t ON fs.id_tiempo = t.id_tiempo
GROUP BY t.ano
ORDER BY t.ano;
```

![image.png](/images/image.png)

![image.png](/images/image1.png)

![image.png](/images/image2.png)

- CONSULTAS DE VISTAS
    
    **vista de siniestros enriquecida**
    
    ```sql
    CREATE OR REPLACE VIEW vw_siniestro_enriquecido AS
    SELECT
      fs.codigo_siniestro,
      t.fecha,
      t.ano,
      t.mes,
      t.dia,
      tv.tipo_de_via,
      tv.zonificacion,
      v.vehiculo,
      p.tipo_persona,
      p.gravedad,
      fs.clase_siniestro,
      fs.cantidad_de_fallecidos,
      fs.cantidad_de_lesionados,
      fs.cantidad_de_vehiculos_danados,
      fs.causa_factor_principal
    FROM f_siniestro fs
    LEFT JOIN dim_tiempo t ON fs.id_tiempo = t.id_tiempo
    LEFT JOIN dim_tipo_via tv ON fs.id_tipo_via = tv.id_tipo_via
    LEFT JOIN dim_vehiculo v ON fs.codigo_vehiculo = v.codigo_vehiculo
    LEFT JOIN dim_persona p ON fs.codigo_persona = p.codigo_persona;
    
    #LUEGO SOLO USAR
    SELECT * FROM vw_siniestro_enriquecido WHERE ano = 2023;
    ```


# Generación de Reportee PowerBI
https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/PARCIAL/G10_SUTRAN_DF_1.pbix

## 1. Instalamos el ODBC para Hive en la PC
Descargamos e instalamos el drive (Cloudera Hive ODBC Driver (más estable para Hortonworks))
![image.png](/images/image4.png)

![image.png](/images/image5.png)

![image.png](/images/image6.png)

Luego seleccionamos HiveSandBox o el nombre de Data Source Name que asignaron.
