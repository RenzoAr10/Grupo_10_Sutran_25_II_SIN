import pandas as pd

df = pd.read_csv("BBDD_ONSV-SINIESTROS_2021-2023.csv", sep=";")

valores = df.values.flatten()
valores = [str(v) for v in valores if pd.notnull(v)]

resultado = ",".join(valores)

with open("resultado.csv", "w", encoding="utf-8") as f:
    f.write(resultado)

print("¡Listo! Archivo 'resultado.csv' generado con comas.")