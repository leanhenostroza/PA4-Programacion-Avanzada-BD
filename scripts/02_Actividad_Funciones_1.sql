USE CasoPractico_PA4;
GO

-- 1. Función escalar: calcula el monto de una operación (Cantidad * PrecioUnitario)
CREATE FUNCTION dbo.fn_Calcular_Monto_Operacion
(
    @Cantidad INT,
    @PrecioUnitario DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Monto DECIMAL(10,2);
    SET @Monto = ISNULL(@Cantidad, 0) * ISNULL(@PrecioUnitario, 0);
    RETURN @Monto;
END;
GO

-- 2. Función de tipo tabla (en línea): devuelve el detalle de operaciones con su monto calculado
CREATE FUNCTION dbo.fn_Detalle_Operaciones
(
    @TipoOperacion VARCHAR(15) = NULL -- Si es NULL, muestra todas; si se indica 'VENTA' o 'COMPRA', filtra
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        op.IdOperacion,
        op.FechaOperacion,
        op.TipoOperacion,
        c.NombreCliente,
        p.NombreProducto,
        op.Cantidad,
        p.Precio AS PrecioUnitario,
        dbo.fn_Calcular_Monto_Operacion(op.Cantidad, p.Precio) AS MontoOperacion
    FROM Operaciones op
    INNER JOIN Clientes c ON op.IdCliente = c.IdCliente
    INNER JOIN Productos p ON op.IdProducto = p.IdProducto
    WHERE (@TipoOperacion IS NULL OR op.TipoOperacion = @TipoOperacion)
);
GO