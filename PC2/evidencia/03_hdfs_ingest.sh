set -euo pipefail

# Esto fue para crear rutas en HDFS (zona RAW)
su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/sutran_accidentes_2020_2021'
su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/estadisticas_accidentes_2012_2018'
su - hdfs -c 'hdfs dfs -mkdir -p /data/raw/victimas_fatales_2012_2018'
su - hdfs -c 'hdfs dfs -chmod -R 755 /data/raw'

# Y acá para subir CSV desde /tmp/datasets a HDFS
su - hdfs -c 'hdfs dfs -put -f /tmp/datasets/sutran_accidentes_2020_2021.csv /data/raw/sutran_accidentes_2020_2021/'
su - hdfs -c 'hdfs dfs -put -f /tmp/datasets/estadisticas_accidentes_2012_2018.csv  /data/raw/estadisticas_accidentes_2012_2018/'
su - hdfs -c 'hdfs dfs -put -f /tmp/datasets/victimas_fatales_2012_2018.csv      /data/raw/victimas_fatales_2012_2018/'
