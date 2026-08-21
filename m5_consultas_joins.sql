USE Ventas_Tech_DB;
--Creación de las tablas faltantes de territorios y canales

CREATE TABLE dbo.territorios (
ID_territorio INT PRIMARY KEY,
region VARCHAR (50) NOT NULL);

GO

CREATE TABLE dbo.canales (
ID_canal INT PRIMARY KEY,
canal VARCHAR (50) NOT NULL);

GO
--Agregar los campos faltantes a las tablas existentes

ALTER TABLE dbo.clientes 
ADD segmento VARCHAR (50),
ID_territorio INT;

GO

ALTER TABLE dbo.ventas
ADD ID_canal INT;

GO

ALTER TABLE dbo.clientes
ADD CONSTRAINT FK_clientes_territorios
FOREIGN KEY (ID_territorio)
REFERENCES dbo.territorios(ID_territorio);

GO

ALTER TABLE dbo.ventas
ADD CONSTRAINT FK_ventas_canales
FOREIGN KEY (ID_canal)
REFERENCES dbo.canales(ID_canal);

GO

INSERT INTO dbo.territorios (ID_territorio,region)
VALUES 
(1,'Buenos Aires'),
(2,'Centro'),
(3,'Litoral'),
(4,'Cuyp'),
(5,'Noroeste');

GO

INSERT INTO dbo.canales (ID_canal,canal)
VALUES 
(1,'Online'),
(2,'Presencial');

GO

UPDATE dbo.clientes
SET segmento = 'Premium',
    ID_territorio = 1
WHERE ID_cliente = 1;

UPDATE dbo.clientes
SET segmento = 'PyME',
    ID_territorio = 2
WHERE ID_cliente = 2;

UPDATE dbo.clientes
SET segmento = 'Particular',
    ID_territorio = 3
WHERE ID_cliente = 3;

UPDATE dbo.clientes
SET segmento = 'PyME',
    ID_territorio = 4
WHERE ID_cliente = 4;

UPDATE dbo.clientes
SET segmento = 'Premium',
    ID_territorio = 5
WHERE ID_cliente = 5;

GO

UPDATE dbo.ventas
SET ID_canal = 1
WHERE ID_venta IN (1, 3, 5, 7, 8);

UPDATE dbo.ventas
SET ID_canal = 2
WHERE ID_venta IN (2, 4, 6, 9, 10);

GO

--CONSULTA 1) VISTA BASE DEL PROYECTO (INNER JOIN)
SELECT
    v.fecha_venta AS fecha,
    c.nombre AS nombre_cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta,
    ca.canal
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
INNER JOIN territorios AS t
    ON c.id_territorio = t.id_territorio
INNER JOIN canales AS ca
    ON v.id_canal = ca.id_canal;

    GO

--CONSULTA 2) CLIENTES SIN VENTAS (LEFT JOIN)
SELECT
c.nombre,
c.email,
c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
ON c.ID_cliente = v.ID_cliente 
WHERE v.ID_cliente IS NULL;

GO
--CONSULTA 3) PRODUCTOS SIN VENTAS (LEFT JOIN)
SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_producto IS NULL;

GO
--CONSULTA 4) CONSOLIDADO POR CANAL (UNION ALL)
SELECT
    canal,
    SUM(cantidad * precio_unitario) AS total_ventas
FROM (
    SELECT
        v.cantidad,
        v.precio_unitario,
        ca.canal
    FROM ventas AS v
    INNER JOIN canales AS ca
        ON v.id_canal = ca.id_canal
    WHERE ca.canal = 'Online'

    UNION ALL

    SELECT
        v.cantidad,
        v.precio_unitario,
        ca.canal
    FROM ventas AS v
    INNER JOIN canales AS ca
        ON v.id_canal = ca.id_canal
    WHERE ca.canal = 'Presencial'
) AS ventas_consolidadas
GROUP BY canal;