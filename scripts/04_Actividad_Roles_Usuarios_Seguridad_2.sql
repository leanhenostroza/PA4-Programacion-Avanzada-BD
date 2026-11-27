USE CasoPractico_PA4;
GO

-- A. Probar usuario Operador: consulta permitida
EXECUTE AS USER = 'usr_operador_prueba';
SELECT USER_NAME() AS UsuarioActivo;
SELECT * FROM dbo.fn_Detalle_Operaciones(NULL);
REVERT;
GO

-- B. Probar usuario Analista: lectura permitida
EXECUTE AS USER = 'usr_analista_prueba';
SELECT USER_NAME() AS UsuarioActivo;
SELECT IdCliente, NombreCliente, Estado FROM dbo.Clientes;
REVERT;
GO

-- C. Comprobar restricción: el Analista no puede insertar en Operaciones
-- (Se espera mensaje de error de permiso denegado en Mensajes)
BEGIN TRY
    EXECUTE AS USER = 'usr_analista_prueba';
    INSERT INTO dbo.Operaciones (IdCliente, IdProducto, Cantidad, TipoOperacion)
    VALUES (1, 1, 1, 'VENTA');
    REVERT;
END TRY
BEGIN CATCH
    REVERT;
    SELECT
        ERROR_NUMBER() AS NumeroError,
        ERROR_MESSAGE() AS MensajeRestriccionEsperada;
END CATCH;
GO