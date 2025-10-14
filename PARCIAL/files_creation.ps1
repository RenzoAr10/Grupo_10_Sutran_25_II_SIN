# Esto es para asegurar carpetas destino con "_"
su - hdfs -c '
hdfs dfs -mkdir -p /data/raw/BBDD_ONSV_PERSONAS_2021_2023
hdfs dfs -mkdir -p /data/raw/BBDD_ONSV_SINIESTROS_2021_2023
hdfs dfs -mkdir -p /data/raw/BBDD_ONSV_VEHICULOS_2021_2023
hdfs dfs -mkdir -p /data/raw/OSITRAN
hdfs dfs -mkdir -p /data/raw/REPORTES_PRELIMINALES
hdfs dfs -mkdir -p /data/raw/ESTADISTICAS_ACCIDENTES_2012_2018
hdfs dfs -mkdir -p /data/raw/SUTRAN_ACCIDENTES_2020_2021
hdfs dfs -mkdir -p /data/raw/VICTIMAS_FATALES_2012_2018
'

# Mover los ONSV (están sueltos) a sus carpetas con "_"
su - hdfs -c 'hdfs dfs -mv /data/raw/BBDD_ONSV_PERSONAS_2021-2023.csv     /data/raw/BBDD_ONSV_PERSONAS_2021_2023/'
su - hdfs -c 'hdfs dfs -mv /data/raw/BBDD_ONSV_SINIESTROS_2021-2023.csv   /data/raw/BBDD_ONSV_SINIESTROS_2021_2023/'
su - hdfs -c 'hdfs dfs -mv /data/raw/BBDD_ONSV_VEHICULOS_2021-2023.csv    /data/raw/BBDD_ONSV_VEHICULOS_2021_2023/'

# OSITRAN / REPORTES: ya hay copia dentro de la carpeta. Borra el duplicado suelto.
su - hdfs -c 'hdfs dfs -rm -skipTrash /data/raw/OSITRAN.csv'
su - hdfs -c 'hdfs dfs -rm -skipTrash /data/raw/REPORTES_PRELIMINALES.csv'

# Mueve desde la carpeta en minúsculas a la carpeta con "_" y borra duplicados sueltos y carpetas antiguas.

# Estadísticas
su - hdfs -c 'hdfs dfs -mv /data/raw/estadisticas_accidentes_2012_2018/estadisticas_accidentes_2012_2018.csv /data/raw/ESTADISTICAS_ACCIDENTES_2012_2018/'
su - hdfs -c 'hdfs dfs -rm -skipTrash /data/raw/estadisticas_accidentes_2012_2018.csv'
su - hdfs -c 'hdfs dfs -rm -r -skipTrash /data/raw/estadisticas_accidentes_2012_2018'

# Sutran
su - hdfs -c 'hdfs dfs -mv /data/raw/sutran_accidentes_2020_2021/sutran_accidentes_2020_2021.csv /data/raw/SUTRAN_ACCIDENTES_2020_2021/'
su - hdfs -c 'hdfs dfs -rm -skipTrash /data/raw/sutran_accidentes_2020_2021.csv'
su - hdfs -c 'hdfs dfs -rm -r -skipTrash /data/raw/sutran_accidentes_2020_2021'

# Víctimas
su - hdfs -c 'hdfs dfs -mv /data/raw/victimas_fatales_2012_2018/victimas_fatales_2012_2018.csv /data/raw/VICTIMAS_FATALES_2012_2018/'
su - hdfs -c 'hdfs dfs -rm -skipTrash /data/raw/victimas_fatales_2012_2018.csv'
su - hdfs -c 'hdfs dfs -rm -r -skipTrash /data/raw/victimas_fatales_2012_2018'

# Verificamo
su - hdfs -c 'hdfs dfs -ls -R /data/raw'