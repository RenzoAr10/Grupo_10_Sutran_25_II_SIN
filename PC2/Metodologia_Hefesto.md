# 📊 Diseño del Modelo de Datos para SUTRAN - Data Marts

Este documento resume la estructura de los tres Data Marts (DM) definidos para el proyecto de Inteligencia de Negocios, incluyendo sus perspectivas (dimensiones) e indicadores (hechos).

---

## 1. DM de Fiscalización y Sanciones 🛡️

**Propósito:** Analizar la eficiencia de los operativos de fiscalización, la recurrencia de las infracciones y el impacto de las sanciones impuestas.

### a. Perspectivas (Dimensiones)
| Dimensión | Descripción | Origen del Dato |
| :--- | :--- | :--- |
| **Tiempo** | Momento de la fiscalización (Fecha, Hora, Mes, Año). | D2, D9, D10 (Fecha de Corte) |
| **Ubicación** | Lugar exacto del operativo (Departamento, KM, Coordenadas, Vía). | D2, D10 |
| **Inspector** | Identificador y unidad orgánica del inspector a cargo de la fiscalización. | **Interno SUTRAN** |
| **Infracción** | Tipo de falta cometida (Código, Gravedad, Tipo de Servicio). | **Interno SUTRAN** / D3, D4 (Causas - Proxy) |
| **Transportista** | Entidad sancionada (RUC, Razón Social, Historial de sanciones). | **Interno SUTRAN** |

### b. Indicadores (Hechos)
| Indicador | Tipo de Medida | Origen del Dato |
| :--- | :--- | :--- |
| **Cantidad de Infracciones** | Aditivo (Count) | **Interno SUTRAN** (ID de Acta) / D10 (NRO_REPORTE - Proxy) |
| **Monto Total de Sanciones** | Aditivo (Sum) | **Interno SUTRAN** (Valor de la Multa) |
| **Puntos Acumulados** | Aditivo (Sum) | **Interno SUTRAN** (Puntos asignados) |
| **Tiempo Promedio de Fiscalización (min)** | Semi-Aditivo (Avg) | **Interno SUTRAN** (Tiempos operativos) |
| **Tasa de Reincidencia** | Calculado (Fórmula) | **Interno SUTRAN** (Historial de Transportistas) |

---


## 2. DM de Movilidad y Siniestralidad 💥

**Propósito:** Analizar la ocurrencia de siniestros, sus factores causales, la respuesta operativa y los resultados en términos de víctimas.

### a. Perspectivas (Dimensiones)
| Dimensión | Descripción | Origen del Dato |
| :--- | :--- | :--- |
| **Tiempo** | Fecha y hora del siniestro. | D2, D4, D10 |
| **Tramo Vial** | Ubicación exacta (Departamento, Kilómetro, Progresiva, Vía). | D2, D4, D10 |
| **Clima** | Condiciones meteorológicas durante el evento (Lluvia, Niebla). | D4, D6 |
| **Tipo de Vía** | Clasificación de la vía (Red Vial, Administrador, Estado de Conservación). | D4, D9 |
| **Causa del Siniestro** | Factor primario que originó el accidente (Exceso de velocidad, Falla mecánica). | D4, D6, D9 |

### b. Indicadores (Hechos)
| Indicador | Tipo de Medida | Origen del Dato |
| :--- | :--- | :--- |
| **Número de Siniestros** | Aditivo (Count) | D4 (CÓDIGO_SINIESTRO), D10 (NRO_REPORTE) |
| **Velocidad Promedio** | Semi-Aditivo (Avg) | **Externo (Sensores/Radar)** / D6 (Causa = Exceso velocidad - Proxy) |
| **Densidad Vehicular** | Semi-Aditivo (Avg) | **Externo (Aforo/Tráfico)** |
| **Índice de Siniestralidad** | Calculado (Fórmula) | D4 (Nro Siniestros) / D2/D10 (KM/Progresiva) |
| **Tiempo Ocurrencia → Reporte (horas)** | Semi-Aditivo (Avg) | D10 (FECHA_CORTE - FECHA_ACC/HORA_ACC) |


# Diagrama Estrella

