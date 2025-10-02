#Estos comandos lo usamos para preparar la carpeta staging en la MV
#!/usr/bin/env bash
set -euo pipefail

# Crear staging legible para hdfs
mkdir -p /tmp/datasets
chmod 777 /tmp/datasets

# Verificación
ls -lh /tmp/datasets/
