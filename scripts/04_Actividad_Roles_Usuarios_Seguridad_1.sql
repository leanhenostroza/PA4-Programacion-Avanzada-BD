USE CasoPractico_PA4;
GO

-- 1. Crear roles de base de datos según responsabilidades
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'rol_operador_comercial' AND type = 'R')
    CREATE ROLE rol_operador_comercial;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'rol_analista_consulta' AND type = 'R')
    CREATE ROLE rol_analista_consulta;
GO

-- 2. Asignar permisos al rol Operador Comercial
GRANT SELECT ON OBJECT::dbo.Clientes TO rol_operador_comercial;
GRANT SELECT ON OBJECT::dbo.Productos TO rol_operador_comercial;
GRANT SELECT, INSERT ON OBJECT::dbo.Operaciones TO rol_operador_comercial;
GRANT SELECT ON OBJECT::dbo.fn_Detalle_Operaciones TO rol_operador_comercial;

-- 3. Asignar permisos al rol Analista de Consulta (solo lectura)
GRANT SELECT ON OBJECT::dbo.Clientes TO rol_analista_consulta;
GRANT SELECT ON OBJECT::dbo.Productos TO rol_analista_consulta;
GRANT SELECT ON OBJECT::dbo.Operaciones TO rol_analista_consulta;
GRANT SELECT ON OBJECT::dbo.fn_Detalle_Operaciones TO rol_analista_consulta;
GO

-- 4. Crear inicios de sesión y usuarios de base de datos de prueba
-- (Nota: usar contraseñas acordes a la política de complejidad del servidor)
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'login_operador_prueba')
    CREATE LOGIN login_operador_prueba WITH PASSWORD = 'Operador#2026!Segura', CHECK_EXPIRATION = OFF, CHECK_POLICY = ON;

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'login_analista_prueba')
    CREATE LOGIN login_analista_prueba WITH PASSWORD = 'Analista#2026!Segura', CHECK_EXPIRATION = OFF, CHECK_POLICY = ON;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'usr_operador_prueba')
    CREATE USER usr_operador_prueba FOR LOGIN login_operador_prueba;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'usr_analista_prueba')
    CREATE USER usr_analista_prueba FOR LOGIN login_analista_prueba;
GO

-- 5. Vincular usuarios a sus roles
ALTER ROLE rol_operador_comercial ADD MEMBER usr_operador_prueba;
ALTER ROLE rol_analista_consulta ADD MEMBER usr_analista_prueba;
GO