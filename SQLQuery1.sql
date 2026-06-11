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
