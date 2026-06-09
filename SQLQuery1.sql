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
