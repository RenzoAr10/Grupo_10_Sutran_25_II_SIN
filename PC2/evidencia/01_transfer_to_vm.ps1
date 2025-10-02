mkdir -p /tmp/datasets
chmod 777 /tmp/datasets

scp -P 2222 "C:\Users\jairo\Documents\datasets_sutran\sutran_accidentes_2020_2021.csv" root@127.0.0.1:/tmp/datasets/
scp -P 2222 "C:\Users\jairo\Documents\datasets_sutran\estadisticas_accidentes_2012_2018.csv" root@127.0.0.1:/tmp/datasets/
scp -P 2222 "C:\Users\jairo\Documents\datasets_sutran\victimas_fatales_2012_2018.csv" root@127.0.0.1:/tmp/datasets/

#El User, Host, Port y Dst indicados pueden varian. En este caso se uso /tmp/datasets/ donde cualquier usuario tiene permisos de escritura y lectura ya que en root tuvimos algunos desaf[ios para copiar el CSV desde Windosws a la VM
