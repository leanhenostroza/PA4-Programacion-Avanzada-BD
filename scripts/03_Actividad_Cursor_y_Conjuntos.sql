USE CasoPractico_PA4;
GO

-- =============================================
-- 1. IMPLEMENTACIÓN Y CONSUMO DE UN CURSOR
-- =============================================
DECLARE @IdOperacion INT;
DECLARE @TipoOperacion VARCHAR(15);
DECLARE @NombreCliente VARCHAR(100);
DECLARE @NombreProducto VARCHAR(100);
DECLARE @Cantidad INT;
DECLARE @Precio DECIMAL(10,2);
DECLARE @Monto DECIMAL(10,2);

-- Variable de tabla para mostrar el recorrido realizado por el cursor
DECLARE @SalidaCursor TABLE (
    OrdenRecorrido INT IDENTITY(1,1),
    IdOperacion INT,
    TipoOperacion VARCHAR(15),
    NombreCliente VARCHAR(100),
    NombreProducto VARCHAR(100),
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2),
    MontoCalculado DECIMAL(10,2)
);

DECLARE cur_Operaciones CURSOR FAST_FORWARD FOR
    SELECT
        op.IdOperacion,
        op.TipoOperacion,
        c.NombreCliente,
        p.NombreProducto,
        op.Cantidad,
        p.Precio
    FROM Operaciones op
    INNER JOIN Clientes c ON op.IdCliente = c.IdCliente
    INNER JOIN Productos p ON op.IdProducto = p.IdProducto
    ORDER BY op.IdOperacion;

OPEN cur_Operaciones;

FETCH NEXT FROM cur_Operaciones
INTO @IdOperacion, @TipoOperacion, @NombreCliente, @NombreProducto, @Cantidad, @Precio;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Monto = dbo.fn_Calcular_Monto_Operacion(@Cantidad, @Precio);

    INSERT INTO @SalidaCursor (
        IdOperacion,
        TipoOperacion,
        NombreCliente,
        NombreProducto,
        Cantidad,
        PrecioUnitario,
        MontoCalculado
    )
    VALUES (
        @IdOperacion,
        @TipoOperacion,
        @NombreCliente,
        @NombreProducto,
        @Cantidad,
        @Precio,
        @Monto
    );

    FETCH NEXT FROM cur_Operaciones
    INTO @IdOperacion, @TipoOperacion, @NombreCliente, @NombreProducto, @Cantidad, @Precio;
END;

CLOSE cur_Operaciones;
DEALLOCATE cur_Operaciones;

-- Mostrar el resultado obtenido recorriendo fila por fila con el cursor
SELECT * FROM @SalidaCursor;
GO

-- =============================================
-- 2. ALTERNATIVA BASADA EN CONJUNTOS (SELECT)
-- =============================================
SELECT
    op.IdOperacion,
    op.TipoOperacion,
    c.NombreCliente,
    p.NombreProducto,
    op.Cantidad,
    p.Precio AS PrecioUnitario,
    dbo.fn_Calcular_Monto_Operacion(op.Cantidad, p.Precio) AS MontoCalculado
FROM Operaciones op
INNER JOIN Clientes c ON op.IdCliente = c.IdCliente
INNER JOIN Productos p ON op.IdProducto = p.IdProducto
ORDER BY op.IdOperacion;
GO CURSOR VS 