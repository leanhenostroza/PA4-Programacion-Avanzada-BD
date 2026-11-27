USE CasoPractico_PA4;
GO

-- 1. Insertar datos iniciales de prueba
INSERT INTO Clientes (NombreCliente, Estado)
VALUES ('Carlos Mendoza', 'Activo');

INSERT INTO Productos (NombreProducto, Precio, Stock)
VALUES ('Cuaderno Cuadriculado A4', 25.00, 10);

-- Ver el producto antes del cambio
SELECT * FROM Productos;

-- 2. Provocar el cambio (UPDATE) para activar el desencadenante
UPDATE Productos
SET Precio = 30.00,
    Stock = 7
WHERE NombreProducto = 'Cuaderno Cuadriculado A4';

-- Ver el producto después del cambio
SELECT * FROM Productos;

-- 3. Verificar qué guardó automáticamente el desencadenante en Auditoria_Productos
SELECT * FROM Auditoria_Productos;