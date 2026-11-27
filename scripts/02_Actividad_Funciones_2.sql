USE CasoPractico_PA4;
GO

-- Insertar operaciones de prueba usando el cliente (IdCliente = 1) y producto (IdProducto = 1) existentes
INSERT INTO Operaciones (IdCliente, IdProducto, Cantidad, TipoOperacion)
VALUES
    (1, 1, 2, 'VENTA'),
    (1, 1, 5, 'COMPRA');

-- 1. Consumo de la función escalar (devuelve un único valor)
SELECT
    IdProducto,
    NombreProducto,
    Precio AS PrecioActual,
    3 AS CantidadSimulada,
    dbo.fn_Calcular_Monto_Operacion(3, Precio) AS MontoSimulado
FROM Productos
WHERE IdProducto = 1;

-- 2. Consumo de la función de tipo tabla: todas las operaciones
SELECT *
FROM dbo.fn_Detalle_Operaciones(NULL);

-- 3. Consumo de la función de tipo tabla: filtrando solo 'VENTA'
SELECT *
FROM dbo.fn_Detalle_Operaciones('VENTA');