Create DataBase EmpresaSQL
go

use EmpresaSQL
go

Create Table TDepartamento(
nDepartamentoID int identity(1,1) primary key,
cNombreDepartamento varchar(100) not null unique
);
go

Create Table TCargo(
nCargoID int Identity(1,1) primary key,
cNombreCargo varchar(100) not null unique
);
go

Create Table TEmpleado(
nEmpleadoID int identity(1,1) primary key,
cNIF Varchar(20) unique,
cNombre Varchar(100),
cApellido varchar(100),
nDepartamentoID int,
nCargoID int,
dFechaContratacion date default getdate(),
nSalario decimal(18,2),
constraint CK_Salario check (nSalario > 300));
go

ALTER TABLE TEmpleado
ADD Constraint FK_Empleado_Departamento
Foreign key(nDepartamentoID)
References TDepartamento(nDepartamentoID);
go

Alter Table TEmpleado
Add constraint FK_Empleado_Cargo
Foreign Key(nCargoID)
References TCargo(nCargoID);
go


Create Table TProyecto(
nProyectoID int identity(1,1) primary key,
cNombreProyecto varchar(100) not null,
dFechaInicio date not null,
dFechaFin date null);
go

create table TEmpleadoProyecto(
nEmpleadoID int,
nProyectoID int,

primary key(nEmpleadoID, nProyectoID),
foreign key(nEmpleadoID)
References TEmpleado(nEmpleadoID),

foreign key(nProyectoID)
References TProyecto(nProyectoID)
);
go

ALTER TABLE TEmpleado
ADD cEmail VARCHAR(100);
GO

ALTER TABLE TEmpleado
ADD cTelefono VARCHAR(15);
GO

ALTER TABLE TEmpleado
ALTER COLUMN cNombre VARCHAR(100);
GO

ALTER TABLE TEmpleado
ALTER COLUMN cApellido VARCHAR(100);
GO

ALTER TABLE TEmpleado
ADD cDireccion VARCHAR(200);
GO

ALTER TABLE TEmpleado
ADD nEdad INT;
GO

ALTER TABLE TEmpleado
ADD CONSTRAINT CK_Edad
CHECK(nEdad BETWEEN 18 AND 65);
GO

ALTER TABLE TEmpleado
ADD CONSTRAINT UQ_Email UNIQUE(cEmail);
GO

ALTER TABLE TEmpleado
ADD bActivo BIT DEFAULT 1;
GO

ALTER TABLE TEmpleado
DROP COLUMN cDireccion;
GO

ALTER TABLE TEmpleado
ALTER COLUMN cTelefono VARCHAR(20);
GO

ALTER TABLE TEmpleado
ADD cGenero CHAR(1);
GO

ALTER TABLE TEmpleado
ADD CONSTRAINT CK_Genero
CHECK(cGenero IN ('M','F'));
GO

ALTER TABLE TEmpleado
ADD dFechaNacimiento DATE;
GO

CREATE TABLE TSucursal(
    nSucursalID INT IDENTITY(1,1) PRIMARY KEY,
    cNombreSucursal VARCHAR(100) NOT NULL,
    cCiudad VARCHAR(100) NOT NULL
);
GO

INSERT INTO TDepartamento(cNombreDepartamento)
VALUES
('Recursos Humanos'),
('Finanzas'),
('Ventas'),
('Marketing'),
('Tecnologia');
GO

INSERT INTO TCargo(cNombreCargo)
VALUES
('Gerente'),
('Analista'),
('Programador'),
('Contador'),
('Vendedor');
GO

INSERT INTO TEmpleado
(cNIF,cNombre,cApellido,nDepartamentoID,nCargoID,nSalario,nEdad,cGenero)
VALUES
('EMP001','Juan','Perez',1,1,1500,35,'M'),
('EMP002','Maria','Gomez',2,2,1200,28,'F'),
('EMP003','Carlos','Lopez',3,5,900,30,'M'),
('EMP004','Ana','Ruiz',4,2,1100,27,'F'),
('EMP005','Pedro','Garcia',5,3,1800,32,'M'),
('EMP006','Laura','Mendez',1,2,1000,26,'F'),
('EMP007','Jose','Gonzalez',2,4,1300,45,'M'),
('EMP008','Sofia','Torres',3,5,950,29,'F'),
('EMP009','Miguel','Castro',4,2,1050,38,'M'),
('EMP010','Elena','Rojas',5,3,2000,31,'F');
GO

INSERT INTO TProyecto
(cNombreProyecto,dFechaInicio,dFechaFinalizacion)
VALUES
('Sistema ERP','2025-01-01','2025-12-31'),
('App Movil','2025-02-01','2025-10-30'),
('Portal Web','2025-03-01','2025-09-30');
GOINSERT INTO TProyecto(cNombreProyecto,dFechaInicio,dFechaFin)

INSERT INTO TEmpleadoProyecto
VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,3),
(7,3),
(8,2),
(9,1),
(10,3);
GO


UPDATE TEmpleado
SET nSalario = nSalario * 1.10;
GO


UPDATE TEmpleado
SET nSalario = nSalario * 1.20
WHERE nDepartamentoID = 1;
GO


UPDATE TEmpleado
SET cEmail='juan@empresa.com'
WHERE nEmpleadoID=1;
GO


UPDATE TEmpleado
SET nCargoID=3
WHERE nEmpleadoID=2;
GO

UPDATE TEmpleado
SET nDepartamentoID=5
WHERE nEmpleadoID IN (3,4);
GO


UPDATE TEmpleado
SET bActivo=0
WHERE nSalario<500;
GO

-- 47
UPDATE TProyecto
SET dFechaFinalizacion='2026-12-31'
WHERE nProyectoID=1;
GO


INSERT INTO TEmpleadoProyecto
VALUES(1,2);
GO

DELETE FROM TEmpleado
WHERE cNIF='EMP010';
GO

DELETE FROM TEmpleado
WHERE bActivo=0;
GO

DELETE FROM TProyecto
WHERE nProyectoID=3;
GO

DELETE FROM TEmpleadoProyecto
WHERE nEmpleadoID=1;
GO

DELETE FROM TDepartamento
WHERE nDepartamentoID=5
AND NOT EXISTS(
    SELECT 1
    FROM TEmpleado
    WHERE nDepartamentoID=5
);
GO