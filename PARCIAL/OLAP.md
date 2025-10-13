

## 1. DM de Fiscalización y Sanciones 🛡️

**Propósito:** Analizar la recurrencia de las infracciones, el perfil de riesgo de los transportistas, y la intervención de control (fiscalización).

### a. Perspectivas (Dimensiones)

| Dimensión | Descripción | Campos Originales Usados | Origen del Dato |
| :--- | :--- | :--- | :--- |
| **Tiempo** | Momento del siniestro y la fecha de corte del reporte. | `FECHA_CORTE`,, `AÑO`, `MES` | D1, D3, D2, D4 |
| **Ubicación** | Lugar exacto donde ocurrió el evento. | `DEPARTAMENTO`, `PROVINCIA`, `DISTRITO`, `CODIGO_VÍA`, `KILOMETRO`, `COORDENADAS LATITUD/LONGITUD` | D1, D3, D6, D5 |
| **Causa/Infracción** | Causa del siniestro, usada como *proxy* de la infracción cometida. | `CLASE SINIESTRO`, `CAUSA FACTOR PRINCIPAL`, `CAUSA ESPECÍFICA` | D3, D2 |
| **Transportista** | Perfil de la entidad (vehículo/conductor) que es sujeto potencial de fiscalización. | `VEHÍCULO`, `MODALIDAD DE TRANSPORTE`, `CLASE_LICENCIA`, `ESTADO SOAT`, `ESTADO CITV` | D4, D2 |
| **Sanción (Acción)** | Indica si se tomó alguna acción administrativa (proxy de sanción). | `ACCIONES TOMADAS` | D5 (OSITRAN) |

### b. Indicadores (Hechos)

| Indicador | Tipo de Medida | Campo Original Usado | Observación (Métrica de Control) |
| :--- | :--- | :--- | :--- |
| **Total de Siniestros** | Aditivo (Count) | `CÓDIGO SINIESTRO` | Conteo de los eventos que detonan el proceso de fiscalización. |
| **Cantidad de Afectados** | Aditivo (Sum) | `PERSONAS AFECTADAS` | Mide la gravedad del incidente a fiscalizar. |
| **Contador de Fallecidos** | Aditivo (Sum) | `CANTIDAD DE FALLECIDOS` | Métrica clave para la gestión de la seguridad vial. |
| **Contador de Vehículos Involucrados** | Aditivo (Sum) | `VEHÍCULOS INV.` | Mide el alcance de la fiscalización del evento. |
| **Eventos con Acción Tomada** | Semi-Aditivo (Count) | `ACCIONES TOMADAS` (No nulo) | Mide la frecuencia de intervención activa. |

---

## 2. DM de Siniestros  🏥

**Propósito:** Analizar el impacto real del siniestro en la población y correlacionar la gravedad de las lesiones con los factores causales.

### a. Perspectivas (Dimensiones)

| Dimensión | Descripción | Campos Originales Usados | Origen del Dato |
| :--- | :--- | :--- | :--- |
| **Tiempo** | Momento exacto del siniestro. | `FECHA SINIESTRO`, `HORA SINIESTRO`, `DÍA` | D3, D2 |
| **Ubicación** | Lugar, características de la vía. | `RED VIAL`, `TIPO DE VÍA`, `ZONIFICACIÓN`, `CONDICIÓN CLIMÁTICA` | D3, D2 |
| **Causa** | Detalle de la causa raíz. | `CAUSA`, `CAUSA ESPECÍFICA` | D2, D3 |
| **Persona (Afectado)** | Perfil de la víctima del siniestro. | `TIPO PERSONA`, `GRAVEDAD`, `EDAD`, `SEXO`, `RESULTADO DEL DOSAJE ETÍLICO CUALITATIVO` | D2 |
| **Vehículo** | Tipo de vehículo y su estado en el momento. | `VEHÍCULO`, `TIPO SEGURO`, `LUGAR IMPACTO VEHÍCULO` | D4 |

### b. Indicadores (Hechos)

| Indicador | Tipo de Medida | Campo Original Usado | Observación |
| :--- | :--- | :--- | :--- |
| **Total de Fallecidos** | Aditivo (Sum) | `CANTIDAD DE FALLECIDOS` | Mide el impacto más grave del siniestro. |
| **Total de Lesionados** | Aditivo (Sum) | `CANTIDAD DE LESIONADOS` | Mide el total de heridos en el siniestro. |
| **Víctimas con Dosaje Positivo**| Aditivo (Count/Sum) | `RESULTADO DEL DOSAJE ETÍLICO CUALITATIVO` | Indicador clave para el análisis de riesgo por factor humano. |
| **Índice de Gravedad (Calculado)** | Calculado | (`FALLECIDOS` / `HERIDOS + FALLECIDOS`) | Mide la letalidad promedio del evento. |
| **Conteo de Personas Ilesas** | Aditivo (Count) | `GRAVEDAD` = ILESO | Mide la supervivencia en el siniestro. |






# Diagrama Estrella
![Fizcalizaciones](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/images/diagrama%20estrella%2001.jpg)

![](https://github.com/RenzoAr10/Grupo_10_Sutran_25_II_SIN/blob/main/images/diagrama%20estrella%2002.jpg)
