#!/bin/bash
set -e
echo "Listar raíz de HDFS"
hdfs dfs -ls /

echo "Crear carpeta de evidencia en /tmp y listar"
hdfs dfs -mkdir -p /tmp/evidence
hdfs dfs -ls /tmp

echo "Subir un archivo pequeño como muestra"
hdfs dfs -put -f /etc/hosts /tmp/evidence/hosts.sample

echo "Verificar contenido"
hdfs dfs -ls /tmp/evidence