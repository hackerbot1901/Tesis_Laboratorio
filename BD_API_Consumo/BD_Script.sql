USE [master]
GO
/****** Object:  Database [Laboratorio]    Script Date: 12/13/2023 6:58:55 PM ******/
CREATE DATABASE [Laboratorio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Laboratorio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSQLSERVER\MSSQL\DATA\Laboratorio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Laboratorio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSQLSERVER\MSSQL\DATA\Laboratorio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Laboratorio] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Laboratorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Laboratorio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Laboratorio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Laboratorio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Laboratorio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Laboratorio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Laboratorio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Laboratorio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Laboratorio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Laboratorio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Laboratorio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Laboratorio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Laboratorio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Laboratorio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Laboratorio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Laboratorio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Laboratorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Laboratorio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Laboratorio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Laboratorio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Laboratorio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Laboratorio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Laboratorio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Laboratorio] SET RECOVERY FULL 
GO
ALTER DATABASE [Laboratorio] SET  MULTI_USER 
GO
ALTER DATABASE [Laboratorio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Laboratorio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Laboratorio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Laboratorio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Laboratorio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Laboratorio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Laboratorio', N'ON'
GO
ALTER DATABASE [Laboratorio] SET QUERY_STORE = ON
GO
ALTER DATABASE [Laboratorio] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Laboratorio]
GO
/****** Object:  Table [dbo].[EstadosOrden]    Script Date: 12/13/2023 6:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosOrden](
	[EstadoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreExamen] [nvarchar](100) NULL,
	[Estado] [nvarchar](50) NULL,
	[NumeroOrden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 12/13/2023 6:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[LaboratorioID] [int] IDENTITY(1,1) NOT NULL,
	[Sucursal] [nvarchar](100) NULL,
	[Token] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LaboratorioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratoristas]    Script Date: 12/13/2023 6:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratoristas](
	[LaboratoristaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Especialidad] [nvarchar](100) NULL,
	[LaboratorioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LaboratoristaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muestras]    Script Date: 12/13/2023 6:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muestras](
	[MuestraID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoBarras] [nvarchar](100) NOT NULL,
	[FechaToma] [date] NULL,
	[PacienteID] [int] NULL,
	[LaboratorioID] [int] NULL,
	[LaboratoristaID] [int] NULL,
	[Edad] [int] NULL,
	[Urgencia] [nvarchar](50) NULL,
	[EstadoOrdenID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MuestraID] ASC,
	[CodigoBarras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 12/13/2023 6:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[PacienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Sexo] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EstadosOrden] ON 

INSERT [dbo].[EstadosOrden] ([EstadoID], [NombreExamen], [Estado], [NumeroOrden]) VALUES (1, N'Examen de Sangre', N'En proceso', 1001)
INSERT [dbo].[EstadosOrden] ([EstadoID], [NombreExamen], [Estado], [NumeroOrden]) VALUES (2, N'Examen de orina', N'En proceso', 1002)
INSERT [dbo].[EstadosOrden] ([EstadoID], [NombreExamen], [Estado], [NumeroOrden]) VALUES (3, N'Examen de esperam', N'Terminado', 1004)
SET IDENTITY_INSERT [dbo].[EstadosOrden] OFF
GO
SET IDENTITY_INSERT [dbo].[Laboratorio] ON 

INSERT [dbo].[Laboratorio] ([LaboratorioID], [Sucursal], [Token]) VALUES (1, N'localhost', N'ABC123')
SET IDENTITY_INSERT [dbo].[Laboratorio] OFF
GO
SET IDENTITY_INSERT [dbo].[Laboratoristas] ON 

INSERT [dbo].[Laboratoristas] ([LaboratoristaID], [Nombre], [Especialidad], [LaboratorioID]) VALUES (1, N'Juan Pérez', N'Bioquímica', 1)
SET IDENTITY_INSERT [dbo].[Laboratoristas] OFF
GO
SET IDENTITY_INSERT [dbo].[Muestras] ON 

INSERT [dbo].[Muestras] ([MuestraID], [CodigoBarras], [FechaToma], [PacienteID], [LaboratorioID], [LaboratoristaID], [Edad], [Urgencia], [EstadoOrdenID]) VALUES (1, N'231031182-1.1', CAST(N'2023-11-29' AS Date), 1, 1, 1, 30, N'Alta', 1)
INSERT [dbo].[Muestras] ([MuestraID], [CodigoBarras], [FechaToma], [PacienteID], [LaboratorioID], [LaboratoristaID], [Edad], [Urgencia], [EstadoOrdenID]) VALUES (2, N'231031200-1.1', CAST(N'2023-11-29' AS Date), 2, 1, 1, 22, N'Baja', 2)
INSERT [dbo].[Muestras] ([MuestraID], [CodigoBarras], [FechaToma], [PacienteID], [LaboratorioID], [LaboratoristaID], [Edad], [Urgencia], [EstadoOrdenID]) VALUES (3, N'231031201-1.1', CAST(N'2023-12-06' AS Date), 3, 1, 1, 25, N'Alta', 3)
SET IDENTITY_INSERT [dbo].[Muestras] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([PacienteID], [Nombre], [Sexo]) VALUES (1, N'Ana García', N'Femenino')
INSERT [dbo].[Pacientes] ([PacienteID], [Nombre], [Sexo]) VALUES (2, N'Giancarlo Narajo', N'Masculino')
INSERT [dbo].[Pacientes] ([PacienteID], [Nombre], [Sexo]) VALUES (3, N'Carlos Andrade', N'Masculino')
INSERT [dbo].[Pacientes] ([PacienteID], [Nombre], [Sexo]) VALUES (4, N'Bryan Hidalgo', N'Masculino')
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
ALTER TABLE [dbo].[Laboratoristas]  WITH CHECK ADD FOREIGN KEY([LaboratorioID])
REFERENCES [dbo].[Laboratorio] ([LaboratorioID])
GO
ALTER TABLE [dbo].[Muestras]  WITH CHECK ADD FOREIGN KEY([EstadoOrdenID])
REFERENCES [dbo].[EstadosOrden] ([EstadoID])
GO
ALTER TABLE [dbo].[Muestras]  WITH CHECK ADD FOREIGN KEY([LaboratorioID])
REFERENCES [dbo].[Laboratorio] ([LaboratorioID])
GO
ALTER TABLE [dbo].[Muestras]  WITH CHECK ADD FOREIGN KEY([LaboratoristaID])
REFERENCES [dbo].[Laboratoristas] ([LaboratoristaID])
GO
ALTER TABLE [dbo].[Muestras]  WITH CHECK ADD FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInfoMuestraPorCodigoBarras]    Script Date: 12/13/2023 6:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerInfoMuestraPorCodigoBarras]
    @CodigoBarras NVARCHAR(100)
AS
BEGIN
    SELECT L.Sucursal, M.CodigoBarras,
           P.Nombre AS 'Nombres del paciente', P.Sexo,
           M.Urgencia, EO.NombreExamen AS 'Nombre del examen',
           EO.Estado AS 'Estado del examen',
		   EO.NumeroOrden AS 'Numero de orden'
    FROM Muestras M
    INNER JOIN Laboratorio L ON M.LaboratorioID = L.LaboratorioID
    INNER JOIN Pacientes P ON M.PacienteID = P.PacienteID
    INNER JOIN EstadosOrden EO ON M.EstadoOrdenID = EO.EstadoID
    WHERE M.CodigoBarras = @CodigoBarras;
END;
GO
USE [master]
GO
ALTER DATABASE [Laboratorio] SET  READ_WRITE 
GO
