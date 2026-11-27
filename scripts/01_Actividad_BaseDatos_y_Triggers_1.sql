-- 1. Crear y usar la base de datos del caso práctico
CREATE DATABASE CasoPractico_PA4;
GO
USE CasoPractico_PA4;
GO

-- 2. Crear las tablas principales: Clientes, Productos y Operaciones
CREATE TABLE Clientes (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    NombreCliente VARCHAR(100) NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'Activo'
);

CREATE TABLE Productos (
    IdProducto INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Operaciones (
    IdOperacion INT IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    TipoOperacion VARCHAR(15) NOT NULL, -- 'VENTA' o 'COMPRA'
    FechaOperacion DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Operaciones_Clientes FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    CONSTRAINT FK_Operaciones_Productos FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

-- 3. Crear la tabla de auditoría donde el trigger guardará los cambios
CREATE TABLE Auditoria_Productos (
    IdAuditoria INT IDENTITY(1,1) PRIMARY KEY,
    IdProducto INT NOT NULL,
    Accion VARCHAR(20) NOT NULL,
    PrecioAnterior DECIMAL(10,2) NULL,
    PrecioNuevo DECIMAL(10,2) NULL,
    StockAnterior INT NULL,
    StockNuevo INT NULL,
    DetalleCambio VARCHAR(250) NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
);
GO