RetailPro 📊
Descripción
RetailPro es un proyecto de análisis de datos aplicado a un negocio de retail tecnológico. El objetivo es construir y analizar una base de datos de ventas para obtener información útil sobre productos, clientes, categorías, facturación y canales de venta.
El proyecto integra SQL Server para la creación, transformación y consulta de los datos, y Power BI para el análisis y visualización de la información.
El análisis permite responder preguntas de negocio como:
¿Cuál es la facturación mensual?
¿Cuáles son los productos con mayor facturación?
¿Qué productos tienen mayor cantidad de unidades vendidas?
¿Cuáles son los clientes recurrentes?
¿Qué clientes o productos no registran ventas?
¿Cómo se distribuyen las ventas según el canal?
¿Qué resultados se obtienen al relacionar ventas, clientes, productos, categorías y territorios?
🛠️ Herramientas utilizadas
SQL Server: creación y gestión de la base de datos.
SQL: creación de tablas, carga de datos, consultas, agregaciones y JOIN.
Power BI: transformación, análisis y visualización de los datos.
GitHub: almacenamiento y versionado del proyecto.
📁 Estructura del repositorio
Archivo	Descripción
ventas_tech_db.sql	Crea la base de datos Ventas_Tech_DB, sus tablas y carga los datos iniciales.
m4_consultas_negocio.sql	Contiene consultas orientadas al análisis del negocio y obtención de indicadores.
m5_consultas_joins.sql	Amplía el modelo con territorios y canales y utiliza diferentes tipos de JOIN.
Ferrero_Rocio_Checkpoint2..pbix	Archivo de Power BI correspondiente al análisis del proyecto.
Pipeline_ETL_Ferrero_Rocio.pbix	Archivo de Power BI relacionado con el proceso de transformación y análisis de datos.
🗄️ Modelo de datos
La base de datos principal se denomina:
Ventas_Tech_DB
El modelo inicial contiene las siguientes tablas:
categorias: información de las categorías de productos.
clientes: datos de los clientes.
productos: catálogo de productos, precios y stock.
ventas: información de las operaciones realizadas.
Posteriormente, el modelo se amplía incorporando:
territorios: regiones geográficas.
canales: canales de venta.
Nuevos atributos para clientes, como segmento y territorio.
El atributo canal para las ventas.
🔎 Análisis realizado
Consultas de negocio
El archivo m4_consultas_negocio.sql contiene consultas para obtener:
Resumen ejecutivo mensual.
Ranking de los productos con mayor facturación.
Clientes recurrentes y gasto acumulado.
Comparación de la facturación mensual respecto del promedio.
Estas consultas utilizan funciones de agregación como SUM, COUNT y AVG, además de GROUP BY, HAVING, subconsultas y expresiones CASE.
Consultas con JOIN
El archivo m5_consultas_joins.sql profundiza el análisis mediante relaciones entre distintas tablas.
Se utilizan:
INNER JOIN
LEFT JOIN
UNION ALL
Claves primarias y foráneas
Entre los análisis realizados se encuentran:
Vista consolidada de ventas con información de clientes, productos, categorías, territorios y canales.
Identificación de clientes sin ventas.
Identificación de productos sin ventas.
Consolidación de ventas por canal.
▶️ Cómo ejecutar el proyecto
Requisitos
Para ejecutar los scripts SQL se necesita:
SQL Server.
SQL Server Management Studio (SSMS) o una herramienta compatible.
Power BI Desktop para visualizar y analizar los datos mediante los archivos .pbix.
Paso 1 — Crear la base de datos
Abrir SQL Server Management Studio y ejecutar:
ventas_tech_db.sql
Este script crea la base de datos Ventas_Tech_DB, genera las tablas principales y carga los datos iniciales.
Paso 2 — Ejecutar las consultas de negocio
Una vez creada la base de datos, ejecutar:
m4_consultas_negocio.sql
El script utiliza:
USE Ventas_Tech_DB;
y permite obtener diferentes indicadores y análisis sobre las ventas.
Paso 3 — Ejecutar las consultas con JOIN
Luego ejecutar:
m5_consultas_joins.sql
Este archivo amplía la estructura de la base de datos incorporando territorios y canales, y posteriormente realiza consultas combinando información de distintas tablas.
Paso 4 — Abrir los informes
Finalmente, abrir los archivos .pbix con Power BI Desktop para explorar las visualizaciones y análisis desarrollados.
📌 Principales hallazgos
A partir de los datos disponibles se observa que:
El producto Laptop Pro 15 lidera la facturación.
El Mouse Inalámbrico presenta la mayor cantidad de unidades vendidas dentro del conjunto analizado.
Los datos disponibles corresponden principalmente al período de marzo de 2024, por lo que el análisis de evolución mensual está limitado.
El proyecto permite analizar las ventas desde diferentes dimensiones: producto, cliente, categoría, territorio y canal.
🎯 Objetivo del proyecto
El objetivo de RetailPro es demostrar la aplicación de herramientas de Data Analytics para transformar datos transaccionales en información útil para la toma de decisiones.
El proyecto combina conocimientos de:
Base de datos → SQL → Análisis de negocio → ETL → Power BI → Visualización
👩‍💻 Autora
Rocío Ferrero
Proyecto desarrollado como parte del proceso de formación en Data Analytics
