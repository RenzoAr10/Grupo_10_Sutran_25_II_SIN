#En la VM del Sandobx (de la consola dentro del a VM)
hostname -f
#Dentro del Sandbox
sudo netstat -plnt | grep 10000
# OUTPUT: tcp6  0  0 :::10000  :::*  LISTEN  12345/java
# Entonces está bien