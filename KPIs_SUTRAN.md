# 📊 KPI’s Iniciales – Proyecto SUTRAN

Este documento contiene la definición, fórmula, fuente de datos, meta y umbrales de los principales **Indicadores Clave de Desempeño (KPI’s)** diseñados para el proyecto de análisis de seguridad vial en la **Superintendencia de Transporte Terrestre de Personas, Carga y Mercancías (SUTRAN)**.  

El objetivo es establecer métricas claras que permitan monitorear la evolución de la siniestralidad, evaluar el impacto de las medidas de fiscalización y facilitar la toma de decisiones estratégicas basadas en datos.

---

## KPI 1 – Tasa de siniestros por cada 10,000 vehículos
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Número de siniestros viales reportados por cada 10,000 vehículos registrados. |
| **Fórmula** | (N° siniestros / N° vehículos) × 10,000 |
| **Unidad** | Tasa (siniestros / 10,000 vehículos) |
| **Frecuencia** | Anual |
| **Nivel** | Estratégico |
| **Fuente** | Dataset 6 (Siniestros por año y región + Vehículos por tipo y región) |
| **Meta** | ≤ 5 |
| **Umbral** | Verde ≤ 5; Amarillo 5–7; Rojo > 7 |

---

## KPI 2 – Tasa de mortalidad vial (fallecidos por 100,000 hab.)
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Fallecidos en accidentes de tránsito por cada 100,000 habitantes. |
| **Fórmula** | (N° fallecidos / Población) × 100,000 |
| **Unidad** | Fallecidos / 100,000 hab. |
| **Frecuencia** | Anual |
| **Nivel** | Estratégico |
| **Fuente** | Dataset 6 (Fallecidos), Dataset 8 (Víctimas 2017–2023), INEI población |
| **Meta** | ≤ 10 |
| **Umbral** | Verde ≤ 10; Amarillo 10–15; Rojo > 15 |

---

## KPI 3 – Índice de siniestralidad por tramo vial (accidentes/km)
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Accidentes ocurridos por kilómetro de tramo vial. |
| **Fórmula** | N° siniestros en tramo / Km de tramo |
| **Unidad** | Accidentes/km |
| **Frecuencia** | Trimestral |
| **Nivel** | Táctico |
| **Fuente** | Dataset 2 (SUTRAN carreteras), Dataset 9 (OSITRAN concesiones) |
| **Meta** | ≤ 0.5 |
| **Umbral** | Verde ≤ 0.5; Amarillo 0.5–1; Rojo > 1 |

---

## KPI 4 – % de siniestros con causa atribuida al conductor
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Porcentaje de accidentes ocasionados por velocidad, ebriedad o imprudencia. |
| **Fórmula** | (Siniestros por causa conductor / Total siniestros) × 100 |
| **Unidad** | % |
| **Frecuencia** | Mensual |
| **Nivel** | Estratégico |
| **Fuente** | Dataset 3 (ONSV personas), Dataset 4 (ONSV siniestros), Dataset 6 (Causas) |
| **Meta** | ≤ 40% |
| **Umbral** | Verde ≤ 40%; Amarillo 40–60%; Rojo > 60% |

---

## KPI 5 – % de vehículos sin SOAT o CITV involucrados en accidentes
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Mide incumplimiento de requisitos de seguridad en accidentes. |
| **Fórmula** | (Vehículos sin SOAT o CITV / Total vehículos accidentados) × 100 |
| **Unidad** | % |
| **Frecuencia** | Mensual |
| **Nivel** | Táctico |
| **Fuente** | Dataset 5 (ONSV vehículos 2021–2023) |
| **Meta** | ≤ 5% |
| **Umbral** | Verde ≤ 5%; Amarillo 5–10%; Rojo > 10% |

---

## KPI 6 – % de accidentes fatales en franjas horarias críticas (20:00–02:00)
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Proporción de accidentes fatales que ocurren en horarios críticos. |
| **Fórmula** | (Accidentes fatales en franja crítica / Total accidentes fatales) × 100 |
| **Unidad** | % |
| **Frecuencia** | Mensual |
| **Nivel** | Táctico |
| **Fuente** | Dataset 2 (SUTRAN carreteras), Dataset 4 (ONSV siniestros), Dataset 6 (Franja horaria) |
| **Meta** | ≤ 25% |
| **Umbral** | Verde ≤ 25%; Amarillo 25–35%; Rojo > 35% |

---

## KPI 7 – Tiempo promedio de atención de accidentes
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Tiempo medio entre la ocurrencia de un accidente y su reporte oficial. |
| **Fórmula** | Σ (Fecha corte – Fecha accidente) / N° accidentes |
| **Unidad** | Minutos / horas |
| **Frecuencia** | Mensual |
| **Nivel** | Operativo |
| **Fuente** | Dataset 9 (OSITRAN), Dataset 10 (Reportes preliminares) |
| **Meta** | ≤ 60 min |
| **Umbral** | Verde ≤ 60; Amarillo 60–120; Rojo > 120 |

---

## KPI 8 – Tasa de reincidencia de conductores sancionados
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Conductores reincidentes en infracciones o con licencia irregular. |
| **Fórmula** | (Conductores reincidentes / Conductores sancionados) × 100 |
| **Unidad** | % |
| **Frecuencia** | Trimestral |
| **Nivel** | Táctico |
| **Fuente** | Dataset 3 (ONSV personas) |
| **Meta** | ≤ 10% |
| **Umbral** | Verde ≤ 10%; Amarillo 10–20%; Rojo > 20% |

---

## KPI 9 – Distribución de accidentes por modalidad de transporte
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Proporción de accidentes según modalidad de vehículo involucrado. |
| **Fórmula** | (Accidentes por modalidad / Total accidentes) × 100 |
| **Unidad** | % |
| **Frecuencia** | Mensual |
| **Nivel** | Estratégico |
| **Fuente** | Dataset 2 (SUTRAN carreteras), Dataset 5 (ONSV vehículos), Dataset 6 (Vehículos por tipo) |
| **Meta** | Ninguna modalidad > 40% |
| **Umbral** | Verde ≤ 40%; Amarillo 40–50%; Rojo > 50% |

---

## KPI 10 – Evolución de accidentes en concesiones viales vs. no concesionadas
| Elemento    | Descripción |
|-------------|-------------|
| **Definición** | Variación de siniestros en carreteras concesionadas frente a no concesionadas. |
| **Fórmula** | (Accidentes concesionadas – Accidentes no concesionadas) / Total accidentes × 100 |
| **Unidad** | % |
| **Frecuencia** | Anual |
| **Nivel** | Estratégico |
| **Fuente** | Dataset 2 (SUTRAN carreteras), Dataset 9 (OSITRAN concesiones) |
| **Meta** | Reducción ≥ 10% |
| **Umbral** | Verde ≥ –10%; Amarillo –10% a 0%; Rojo > 0% |
