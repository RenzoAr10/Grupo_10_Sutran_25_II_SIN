#!/usr/bin/env bash
set -euo pipefail

su - hdfs -c 'hdfs dfs -ls -h /data/raw'
su - hdfs -c 'hdfs dfs -ls -h /data/raw/sutran_accidentes_2020_2021'
su - hdfs -c 'hdfs dfs -ls -h /data/raw/estadisticas_accidentes_2012_2018'
su - hdfs -c 'hdfs dfs -ls -h /data/raw/victimas_fatales_2012_2018'

# (Opcional) primeras líneas
su - hdfs -c 'hdfs dfs -cat /data/raw/sutran_accidentes_2020_2021/sutran_accidentes_2020_2021.csv | head -n 5' || true
