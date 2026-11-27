USE CasoPractico_PA4;
GO

CREATE TRIGGER trg_Auditar_Actualizacion_Producto
ON Productos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Auditoria_Productos (
        IdProducto,
        Accion,
        PrecioAnterior,
        PrecioNuevo,
        StockAnterior,
        StockNuevo,
        DetalleCambio
    )
    SELECT
        i.IdProducto,
        'UPDATE',
        d.Precio,
        i.Precio,
        d.Stock,
        i.Stock,
        CONCAT(
            'Producto: ', i.NombreProducto,
            ' | Precio: ', d.Precio, ' -> ', i.Precio,
            ' | Stock: ', d.Stock, ' -> ', i.Stock
        )
    FROM inserted i
    INNER JOIN deleted d ON i.IdProducto = d.IdProducto
    WHERE i.Precio <> d.Precio OR i.Stock <> d.Stock;
END;
GO