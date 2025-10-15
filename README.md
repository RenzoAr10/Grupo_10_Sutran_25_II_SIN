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
pscp.exe -P 2222 -pw Jairo2004 C:\Users\jairo\Documents\datasets_sutran\*.csv root@127.0.0.1:/opt/datasets/
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

### 2.3. Carga de archivos a HDFS

Mover cada CSV a su respectiva carpeta dentro de `/data/raw/`:
Aca se hizo un proceso de reemplazo y eliminación de algunos archivos CSV que quisimos reemplazar, se sobreescribio

```bash
su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/BBDD_ONSV_PERSONAS_2021_2023'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/BBDD_ONSV_PERSONAS_2021-2023.csv /data/raw/BBDD_ONSV_PERSONAS_2021_2023/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/BBDD_ONSV_SINIESTROS_2021_2023'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/BBDD_ONSV_SINIESTROS_2021-2023.csv /data/raw/BBDD_ONSV_SINIESTROS_2021_2023/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/BBDD_ONSV_VEHICULOS_2021_2023'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/BBDD_ONSV_VEHICULOS_2021-2023.csv /data/raw/BBDD_ONSV_VEHICULOS_2021_2023/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/OSITRAN'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/OSITRAN.csv /data/raw/OSITRAN/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/REPORTES_PRELIMINARES'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/REPORTES_PRELIMINALES.csv /data/raw/REPORTES_PRELIMINARES/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/SUTRAN_ACCIDENTES_2020_2021'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/sutran_accidentes_2020_2021.csv /data/raw/SUTRAN_ACCIDENTES_2020_2021/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/ESTADISTICAS_ACCIDENTES_2012_2018'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/estadisticas_accidentes_2012_2018.csv /data/raw/ESTADISTICAS_ACCIDENTES_2012_2018/'

su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/VICTIMAS_FATALES_2012_2018'
su - hdfs -c 'hdfs dfs -put -f /opt/datasets/victimas_fatales_2012_2018.csv /data/raw/VICTIMAS_FATALES_2012_2018/'
```

Verificación global:

```bash
su - hdfs -c 'hdfs dfs -ls -R /data/raw'
```

---

## 3. Creación de tablas externas en Hive

Abrir Beeline:

```bash
beeline -u "jdbc:hive2://localhost:10000/default" -n maria_dev
```

### 3.1. Base de datos RAW

```sql
CREATE DATABASE IF NOT EXISTS raw;
USE raw;
```

[Ver código](PARCIAL/evidencia/RAW_create_db_and_table.sql)

---

### 3.2. Base de datos CURATED

```sql
CREATE DATABASE IF NOT EXISTS curated;
USE curated;
```
[Ver código](PARCIAL/evidencia/CURATED_table.sql)

---

## 4. Consultas de control (zona RAW)

Validar que las tablas se crearon correctamente y contienen registros:

```sql
-- Listar bases de datos
SHOW DATABASES;

-- Listar tablas en zona RAW
USE raw;
SHOW TABLES;

-- Vista rápida de columnas
DESCRIBE raw.sutran_accidentes_2020_2021;

-- Conteo de registros
SELECT COUNT(*) FROM raw.sutran_accidentes_2020_2021;

-- Top 10 registros
SELECT * FROM raw.sutran_accidentes_2020_2021 LIMIT 10;

-- Consulta agrupada
SELECT departamento, SUM(fallecidos) AS total_fallecidos
FROM raw.sutran_accidentes_2020_2021
GROUP BY departamento
ORDER BY total_fallecidos DESC
LIMIT 10;
```

> Estas consultas sirven como evidencia de control antes de avanzar a la zona **curated** o al proceso ETL.

---

## 5. Evidencia técnica esperada

**Screenshots recomendados para tu informe:**

* Ambari con servicios HDFS, Hive y Spark activos.
* WebShell mostrando estructura `/data/raw` con `hdfs dfs -ls -R /data/raw`.
* Beeline con los comandos `SHOW TABLES` y `SELECT COUNT(*)`.
* Resultado visible del “Top 10” de registros en una tabla raw.

---

## 6. Notas y dificultades técnicas

Durante la implementación se identificaron algunos retos:

* Algunos archivos tenían **acentos o espacios en los nombres de columnas**, lo que provocó errores de lectura en Hive/Spark (solución: normalización manual de cabeceras).
* En la ingesta inicial, los archivos alojados en **OneDrive** generaban errores por rutas dinámicas; se corrigió moviéndolos a `C:\Users\jairo\Documents\datasets_sutran`.
* Al ejecutar Spark, se requirió **usar rutas completas del binario** (`/usr/hdp/current/spark2-client/bin/spark-submit`) por no estar en el PATH.
* Se optó por construir las tablas directamente en Hive para evitar pérdida de tiempo en configuración de PySpark.

---

## 8. Próximos pasos (para el Parcial)

* Implementar transformaciones con PySpark (limpieza, particionado y carga a `curated`).
* Validar los resultados con `MSCK REPAIR TABLE` y consultas agregadas.
* Conectar Hive con Power BI mediante ODBC o exportación CSV.
* Generar dashboard preliminar (KPIs de siniestralidad vial).


