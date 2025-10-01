# METODOLOGIA KIMBALL
La metodología Kimball es un enfoque ágil y centrado en el negocio para construir un Data Warehouse. Se enfoca en entregar valor rápidamente a los usuarios, en este caso, a las áreas de SUTRAN que requieren análisis de datos para la toma de decisiones.

A continuación, se detalla la aplicación:

### 1. Entender los Procesos de Negocio
La base de la metodología Kimball es identificar los procesos de negocio que son clave para la operación de SUTRAN. En lugar de intentar modelar todo de una vez, se aborda cada proceso de forma individual y por etapas.

**Procesos de Negocio en SUTRAN:**
* **Fiscalización de Transporte:** Inspecciones, actas de control, sanciones, puntos de infracción.
* **Gestión de Habilitaciones:** Licencias, autorizaciones de rutas, permisos especiales.

* **Atención al Ciudadano:** Reclamos, denuncias, consultas.

* **Gestión de la Flota:** Registro de vehículos, mantenimiento, historial de siniestros.

Cada uno de estos procesos se convertirá en un "Data Mart" que se construirá y se pondrá a disposición de las áreas correspondientes.

### 2. Modelado Dimensional
Para cada uno de los procesos identificados, se construirá un esquema en estrella, que es el corazón de la metodología.

El esquema en estrella consta de dos tipos de tablas:

* **Tabla de Hechos:** Contiene los indicadores numéricos y medibles del proceso de negocio.

    * **Proceso de Fiscalización:**

        * `cantidad_infracciones`
        * `monto_sancion`
        * `puntos_acumulados`
        * `tiempo_fiscalizacion`

* **Tablas de Dimensiones:** Contienen la información descriptiva que contextualiza los hechos. Estas tablas permiten segmentar, filtrar y agrupar los datos de manera significativa.

    * **Dimensiones para el Proceso de Fiscalización:**

        * `Dim_Tiempo:` Año, Mes, Día, Hora.
        * `Dim_Ubicacion:` Departamento, Provincia, Distrito, Vía.
        * `Dim_Infraccion:` Tipo de Infracción, Descripción, Código.
        * `Dim_Inspector:` Nombre, Área, Código de Inspector.
        * `Dim_Transportista:` RUC, Razón Social, Tipo de Servicio.

**Explicación:** Los usuarios de SUTRAN podrán, por ejemplo, analizar el monto_sancion (Hecho) por Tipo de Infracción (Dimensión) en un Departamento (Dimensión) específico para el último mes (Dimensión).

### 3. Uso de Dimensiones Conformadas
A medida que se construyan más Data Marts (por ejemplo, el de Fiscalización y el de Gestión de Habilitaciones), se reutilizarán las mismas tablas de dimensiones que son comunes. Esto se conoce como Dimensiones Conformadas.

La dimensión Dim_Tiempo será la misma para analizar los datos de fiscalización, las quejas ciudadanas y las habilitaciones. Esto asegura que todos los reportes de SUTRAN hablen el mismo "idioma" y se puedan comparar de manera coherente.

### 4. Ciclo de Vida del Desarrollo
La implementación se realizará en ciclos cortos e iterativos, en lugar de un proyecto masivo de un año.

1.  **Etapa 1:** Se define y construye el Data Mart de Fiscalización. Se implementa el proceso de ETL (Extracción, Transformación y Carga) para extraer datos de los sistemas de origen de SUTRAN (como el sistema de gestión de infracciones), transformarlos y cargarlos en las tablas de hechos y dimensiones.

2.  **Etapa 2:** Se entrega a los usuarios de las áreas de Fiscalización los primeros informes y dashboards para que puedan comenzar a tomar decisiones.

3.  **Etapa 3:** Se inicia el siguiente ciclo para el proceso de Gestión de Habilitaciones, reutilizando las dimensiones conformadas existentes.
