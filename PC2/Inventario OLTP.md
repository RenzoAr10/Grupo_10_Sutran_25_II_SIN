# Inventario OLTP

Este documento presenta los **sistemas y registros** definidos para el proyecto, con detalles sobre las áreas usuarias, tecnologías, frecuencias de actualización y observaciones. A continuación, se detallan los sistemas relevantes con sus respectivas características.

---

## 1. Gestión de Infracciones y Sanciones

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Procedimientos y Sanciones                                      |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | PostgreSQL/Oracle (app transaccional)                                        |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Actas, códigos de infracción, montos, puntos. Base para reincidencia (con cruce personas) y hotspots. Reglas de deduplicación. |

---

## 2. Atención al Ciudadano (Denuncias)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Articulación Territorial                                        |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | WebApp + BD transaccional                                                   |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Denuncias, SLA de respuesta y canal. Contexto operativo; puede alimentar alertas y tiempos de atención. |

---

## 3. Control de Pesos y Medidas (Balanzas)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | Sensores/CSV batch → BD operativa                                           |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Eventos de sobrepeso por placa/ubicación. Enriquecen análisis de tramos y operativos. |

---

## 4. Autorizaciones y Habilitaciones

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Administración                                                   |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | Oracle/SOA (trámites)                                                        |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Permisos/licencias de operación. Útil para formalización y cruces con infracciones. |

---

## 5. Carreteras y Tramos (red vial SUTRAN)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Planeamiento y Presupuesto + Gerencia de Supervisión y Fiscalización |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | PostgreSQL/Geodatos (GIS)                                                   |
| **Frecuencia de actualización**    | Mensual (actualización de catálogos)                                         |
| **Observaciones**                  | Catálogo de tramos/km. Clave para accidentes/km y alineación con OSITRAN.  |

---

## 6. Registro de Conductores y Licencias (MTC)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/Intercambio de archivos                                                 |
| **Frecuencia de actualización**    | Semanal                                                                     |
| **Observaciones**                  | Estado de licencias y sanciones. Soporta controles en carretera y reincidencia. |

---

## 7. SOAT (Aseguradoras / SBS)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/CSV (reportes)                                                          |
| **Frecuencia de actualización**    | Semanal                                                                     |
| **Observaciones**                  | Vigencia de pólizas. Insumo para % sin SOAT en accidentes (cruce con ONSV/SUTRAN). |

---

## 8. CITV – Revisiones Técnicas

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Supervisión y Fiscalización                                      |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/CSV                                                                     |
| **Frecuencia de actualización**    | Semanal                                                                     |
| **Observaciones**                  | Vigencia de revisión técnica por placa. Insumo para % sin CITV.             |

---

## 9. OSITRAN – Concesiones Viales

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Planeamiento y Presupuesto                                        |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | API/CSV (regulatorio)                                                       |
| **Frecuencia de actualización**    | Mensual (cierres t/a)                                                       |
| **Observaciones**                  | Red concesionada, km y eventos. Base para concesionadas vs. no concesionadas y para accidentes/km (alinear catálogos). |

---

## 10. ONSV – Observatorio de Seguridad Vial

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Seguimiento y Evaluación                                        |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | CSV/Excel/API (publicaciones)                                               |
| **Frecuencia de actualización**    | Mensual (algunos cortes anuales)                                            |
| **Observaciones**                  | Siniestros, víctimas, causas, parque vehicular. Alimenta tasa siniestros/10k, tasa mortalidad, % causa conductor, franja horaria. |

---

## 11. INEI – Población y Parque Vehicular

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Oficina de Planeamiento y Presupuesto                                        |
| **Tipo**                           | Externo                                                                     |
| **Tecnología**                     | CSV/Excel                                                                   |
| **Frecuencia de actualización**    | Anual                                                                       |
| **Observaciones**                  | Población y parque por región/tipo. Denominadores para tasas (10k vehículos, 100k hab.). |

---

## 12. Reportes Operativos/Preliminares (Centro de Control)

| Elemento                          | Descripción                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| **Área usuaria**                   | Gerencia de Articulación Territorial                                        |
| **Tipo**                           | Interno                                                                     |
| **Tecnología**                     | Formularios/CSV→BD                                                          |
| **Frecuencia de actualización**    | Diaria                                                                      |
| **Observaciones**                  | Marca de ocurrencia y hora de notificación. Clave para tiempo promedio de atención. |
