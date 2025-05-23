USE [master]
GO
/****** Object:  Database [GestionClientesFacturacion]    Script Date: 24/04/2025 5:29:12:PM ******/
CREATE DATABASE [GestionClientesFacturacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestionClientesFacturacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GestionClientesFacturacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestionClientesFacturacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GestionClientesFacturacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GestionClientesFacturacion] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestionClientesFacturacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestionClientesFacturacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GestionClientesFacturacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestionClientesFacturacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestionClientesFacturacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GestionClientesFacturacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestionClientesFacturacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestionClientesFacturacion] SET  MULTI_USER 
GO
ALTER DATABASE [GestionClientesFacturacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestionClientesFacturacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestionClientesFacturacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestionClientesFacturacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GestionClientesFacturacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GestionClientesFacturacion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GestionClientesFacturacion] SET QUERY_STORE = ON
GO
ALTER DATABASE [GestionClientesFacturacion] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GestionClientesFacturacion]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Correo] [varchar](254) NULL,
	[Telefono] [varchar](15) NULL,
	[Estado] [varchar](15) NULL,
 CONSTRAINT [PK__Clientes__D59466427522E9B8] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NULL,
	[Descripción] [varchar](100) NULL,
	[Cantidad] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Subtotal]  AS ([Cantidad]*[Precio]),
 CONSTRAINT [PK__DetalleF__E43646A5DD0E618A] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[Fecha] [date] NULL,
	[Total] [decimal](10, 2) NULL,
	[Estado] [varchar](15) NULL,
 CONSTRAINT [PK__Facturas__50E7BAF18DB7DA24] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](50) NULL,
	[Contraseña] [nvarchar](50) NULL,
	[Rol] [nvarchar](50) NULL,
 CONSTRAINT [PK__Usuarios__5B65BF979059E5C0] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (56, N'Maria Anders', N'maria.anders@email.com', N'030-0074321', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (57, N'Ana Trujillo', N'ana.trujillo@email.com', N'(5) 555-4729', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (58, N'Antonio Moreno', N'antonio.moreno@email.com', N'(5) 555-3932', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (59, N'Thomas Hardy', N'thomas.hardy@email.com', N'(171) 555-7788', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (60, N'Christina Berglund', N'christina.berglund@email.com', N'0921-12 34 65', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (61, N'Hanna Moos', N'hanna.m@email.com', N'0621-08460', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (62, N'Frédérique Citeaux', N'frederique.citeaux@email.com', N'88.60.15.31', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (63, N'Martín Sommer', N'martin.sommer@email.com', N'(91) 555 22 82', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (64, N'Laurence Lebihan', N'laurence.lebihan@email.com', N'91.24.45.40', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (65, N'Elizabeth Lincoln', N'elizabeth.lincoln@email.com', N'(604) 555-4729', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (66, N'Victoria Ashworth', N'victoria.ashworth@email.com', N'(171) 555-1212', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (67, N'Patricio Simpson', N'patricio.simpson@email.com', N'(1) 135-5555', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (68, N'Francisco Chang', N'francisco.chang@email.com', N'(5) 555-3392', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (69, N'Yang Wang', N'yang.wang@email.com', N'0452-076545', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (70, N'Pedro Afonso', N'pedro.afonso@email.com', N'(11) 555-7647', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (71, N'Elizabeth Brown', N'elizabeth.brown@email.com', N'(171) 555-2282', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (72, N'Sven Ottlieb', N'sven.ottlieb@email.com', N'0241-039123', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (73, N'Janine Labrune', N'janine.labrune@email.com', N'40.67.88.88', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (74, N'Ann Devon', N'ann.devon@email.com', N'(171) 555-0297', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (75, N'Roland Mendel', N'roland.mendel@email.com', N'7675-3425', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (76, N'Aria Cruz', N'aria.cruz@email.com', N'(11) 555-9857', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (77, N'Diego Roel', N'diego.roel@email.com', N'(91) 555 94 44', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (78, N'Martine Rancé', N'martine.rance@email.com', N'20.16.10.16', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (79, N'Maria Larsson', N'maria.larsson@email.com', N'0695-34 67 21', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (80, N'Peter Franken', N'peter.franken@email.com', N'089-0877310', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (81, N'Carine Schmitt', N'carine.schmitt@email.com', N'40.32.21.21', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (82, N'Paolo Accorti', N'paolo.accorti@email.com', N'011-4988260', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (83, N'Lino Rodriguez', N'lino.rodriguez@email.com', N'(1) 354-2534', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (84, N'Eduardo Saavedra', N'eduardo.saavedra@email.com', N'(93) 203 4560', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (85, N'José Pedro Freyre', N'jose.freyre@email.com', N'(95) 555 82 82', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (86, N'André Fonseca', N'andre.fonseca@email.com', N'(11) 555-9482', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (87, N'Howard Snyder', N'howard.snyder@email.com', N'(503) 555-7555', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (88, N'Manuel Pereira', N'manuel.pereira@email.com', N'(2) 283-2951', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (89, N'Mario Pontes', N'mario.pontes@email.com', N'(21) 555-0091', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (90, N'Carlos Hernández', N'carlos.hernandez@email.com', N'(5) 555-1340', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (91, N'Yoshi Latimer', N'yoshi.latimer@email.com', N'(503) 555-6874', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (92, N'Patricia McKenna', N'patricia.mckenna@email.com', N'2967 542', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (93, N'Helen Bennett', N'helen.bennett@email.com', N'(198) 555-8888', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (94, N'Philip Cramer', N'philip.cramer@email.com', N'0555-09876', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (95, N'Daniel Tonini', N'daniel.tonini@email.com', N'30.59.84.10', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (96, N'Annette Roulet', N'annette.roulet@email.com', N'61.77.61.10', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (97, N'Yoshi Tannamuri', N'yoshi.tannamuri@email.com', N'(604) 555-3392', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (98, N'John Steel', N'john.steel@email.com', N'(509) 555-7969', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (99, N'Renate Messner', N'renate.messner@email.com', N'069-0245984', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (100, N'Jaime Yorres', N'jaime.yorres@email.com', N'(415) 555-5938', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (101, N'Carlos González', N'carlos.gonzalez@email.com', N'(9) 331-6954', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (102, N'Felipe Izquierdo', N'felipe.izquierdo@email.com', N'(8) 34-56-12', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (103, N'Fran Wilson', N'fran.wilson@email.com', N'(503) 555-9573', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (104, N'Giovanni Rovelli', N'giovanni.rovelli@email.com', N'035-640230', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (105, N'Catherine Dewey', N'catherine.dewey@email.com', N'(02) 201 24 67', N'Inactivo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (106, N'Ysauri Jiménez', N'ysmajimo@gmail.com', N'809-674-2747', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (107, N'José Jiménez', N'jose@gmail.com', N'809-432-4234', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (108, N'Darkis Morales', N'darkis@gmail.com', N'809-222-3344', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (109, N'Anyelis Jimenez', N'anye@gmail.com', N'809-534-1646', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (110, N'Elsa Maria', N'elsa@gmail.com', N'809-434-3455', N'Activo')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Correo], [Telefono], [Estado]) VALUES (111, N'Laudino Mateo', N'laudino@gmail.com', N'809-433-4535', N'Inactivo')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleFactura] ON 

INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (1, 51, N'Monitor 24 pulgadas', 5, CAST(242.63 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (2, 52, N'Audífonos Bluetooth', 3, CAST(183.08 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (3, 53, N'Memoria RAM 16GB', 4, CAST(398.08 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (4, 54, N'Teclado mecánico', 2, CAST(159.17 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (5, 55, N'Mouse inalámbrico', 2, CAST(450.40 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (6, 56, N'Router WiFi 6', 2, CAST(61.19 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (7, 57, N'Monitor 24 pulgadas', 5, CAST(488.93 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (8, 58, N'Webcam HD', 3, CAST(381.91 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (9, 59, N'Laptop Lenovo', 5, CAST(242.88 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (10, 60, N'Mouse inalámbrico', 3, CAST(100.60 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (11, 61, N'Laptop Lenovo', 3, CAST(214.07 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (12, 62, N'Router WiFi 6', 1, CAST(352.06 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (13, 63, N'Audífonos Bluetooth', 1, CAST(149.34 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (14, 64, N'Laptop Lenovo', 2, CAST(216.74 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (15, 65, N'Router WiFi 6', 4, CAST(30.41 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (16, 66, N'Disco SSD 1TB', 3, CAST(441.61 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (17, 67, N'Teclado mecánico', 2, CAST(330.86 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (18, 68, N'Memoria RAM 16GB', 2, CAST(431.89 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (19, 69, N'Silla ergonómica', 1, CAST(226.27 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (20, 70, N'Audífonos Bluetooth', 1, CAST(361.69 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (21, 71, N'Router WiFi 6', 1, CAST(181.84 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (22, 72, N'Teclado mecánico', 2, CAST(356.13 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (23, 73, N'Disco SSD 1TB', 2, CAST(94.37 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (24, 74, N'Teclado mecánico', 3, CAST(243.27 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (25, 75, N'Audífonos Bluetooth', 2, CAST(403.77 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (26, 76, N'Teclado mecánico', 5, CAST(334.94 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (27, 77, N'Disco SSD 1TB', 3, CAST(313.11 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (28, 78, N'Mouse inalámbrico', 5, CAST(91.44 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (29, 79, N'Webcam HD', 5, CAST(191.56 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (30, 80, N'Router WiFi 6', 3, CAST(75.58 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (31, 81, N'Monitor 24 pulgadas', 2, CAST(332.01 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (32, 82, N'Teclado mecánico', 4, CAST(287.71 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (33, 83, N'Silla ergonómica', 2, CAST(368.91 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (34, 84, N'Monitor 24 pulgadas', 5, CAST(243.18 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (35, 85, N'Laptop Lenovo', 3, CAST(304.58 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (36, 86, N'Mouse inalámbrico', 4, CAST(205.89 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (37, 87, N'Router WiFi 6', 2, CAST(313.34 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (38, 88, N'Teclado mecánico', 2, CAST(78.64 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (39, 89, N'Disco SSD 1TB', 2, CAST(139.28 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (40, 90, N'Mouse inalámbrico', 3, CAST(301.13 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (41, 91, N'Memoria RAM 16GB', 1, CAST(87.01 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (42, 92, N'Webcam HD', 5, CAST(123.61 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (43, 93, N'Monitor 24 pulgadas', 1, CAST(113.12 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (44, 94, N'Audífonos Bluetooth', 1, CAST(321.45 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (45, 95, N'Laptop Lenovo', 5, CAST(403.87 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (46, 96, N'Memoria RAM 16GB', 1, CAST(89.59 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (47, 97, N'Router WiFi 6', 3, CAST(374.96 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (48, 98, N'Webcam HD', 1, CAST(352.18 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (49, 99, N'Monitor 24 pulgadas', 5, CAST(101.37 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (50, 100, N'Disco SSD 1TB', 3, CAST(356.07 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (51, 101, N'Router WiFi 6', 2, CAST(346.64 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (52, 102, N'Silla ergonómica', 5, CAST(378.78 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (53, 103, N'Laptop Lenovo', 3, CAST(152.36 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (54, 104, N'Disco SSD 1TB', 3, CAST(94.79 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (57, 105, N'Laptop Dell', 1, CAST(34.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [Descripción], [Cantidad], [Precio]) VALUES (58, 106, N'Smartphone', 1, CAST(25.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetalleFactura] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (51, 56, CAST(N'1996-07-04' AS Date), CAST(440.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (52, 57, CAST(N'1996-07-05' AS Date), CAST(1863.40 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (53, 58, CAST(N'1996-07-08' AS Date), CAST(2483.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (54, 59, CAST(N'1996-07-09' AS Date), CAST(3730.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (55, 60, CAST(N'1996-07-10' AS Date), CAST(1444.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (56, 61, CAST(N'1996-07-11' AS Date), CAST(625.20 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (57, 62, CAST(N'1996-07-12' AS Date), CAST(2490.50 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (58, 63, CAST(N'1996-07-15' AS Date), CAST(517.80 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (59, 64, CAST(N'1996-07-16' AS Date), CAST(1119.90 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (60, 65, CAST(N'1996-07-17' AS Date), CAST(2018.60 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (61, 66, CAST(N'1996-07-18' AS Date), CAST(100.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (62, 67, CAST(N'1996-07-19' AS Date), CAST(2194.20 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (63, 68, CAST(N'1996-07-22' AS Date), CAST(624.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (64, 69, CAST(N'1996-07-23' AS Date), CAST(2464.80 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (65, 70, CAST(N'1996-07-24' AS Date), CAST(724.50 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (66, 71, CAST(N'1996-07-25' AS Date), CAST(1176.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (67, 72, CAST(N'1996-07-26' AS Date), CAST(364.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (68, 73, CAST(N'1996-07-29' AS Date), CAST(4031.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (69, 74, CAST(N'1996-07-30' AS Date), CAST(1101.20 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (70, 75, CAST(N'1996-07-31' AS Date), CAST(676.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (71, 76, CAST(N'1996-08-01' AS Date), CAST(1424.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (72, 77, CAST(N'1996-08-02' AS Date), CAST(1456.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (73, 78, CAST(N'1996-08-05' AS Date), CAST(2142.40 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (74, 79, CAST(N'1996-08-06' AS Date), CAST(538.60 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (75, 80, CAST(N'1996-08-07' AS Date), CAST(307.20 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (76, 81, CAST(N'1996-08-08' AS Date), CAST(420.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (77, 82, CAST(N'1996-08-09' AS Date), CAST(1200.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (78, 83, CAST(N'1996-08-12' AS Date), CAST(1488.80 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (79, 84, CAST(N'1996-08-13' AS Date), CAST(468.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (80, 85, CAST(N'1996-08-14' AS Date), CAST(699.70 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (81, 86, CAST(N'1996-08-15' AS Date), CAST(155.40 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (82, 87, CAST(N'1996-08-16' AS Date), CAST(1414.80 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (83, 88, CAST(N'1996-08-19' AS Date), CAST(1452.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (84, 89, CAST(N'1996-08-20' AS Date), CAST(2179.20 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (85, 90, CAST(N'1996-08-21' AS Date), CAST(3016.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (86, 91, CAST(N'1996-08-22' AS Date), CAST(924.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (87, 92, CAST(N'1996-08-23' AS Date), CAST(89.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (88, 93, CAST(N'1996-08-26' AS Date), CAST(479.40 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (89, 94, CAST(N'1996-08-27' AS Date), CAST(2721.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (90, 95, CAST(N'1996-08-28' AS Date), CAST(1296.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (91, 96, CAST(N'1996-08-29' AS Date), CAST(848.70 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (92, 97, CAST(N'1996-08-30' AS Date), CAST(1887.60 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (93, 98, CAST(N'1996-09-02' AS Date), CAST(121.60 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (94, 99, CAST(N'1996-09-03' AS Date), CAST(1050.60 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (95, 100, CAST(N'1996-09-04' AS Date), CAST(1420.00 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (96, 101, CAST(N'1996-09-05' AS Date), CAST(3127.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (97, 102, CAST(N'1996-09-06' AS Date), CAST(349.50 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (98, 103, CAST(N'1996-09-09' AS Date), CAST(1363.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (99, 104, CAST(N'1996-09-10' AS Date), CAST(2708.80 AS Decimal(10, 2)), N'Activo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (100, 105, CAST(N'1996-09-11' AS Date), CAST(1242.00 AS Decimal(10, 2)), N'Inactivo')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (101, 106, CAST(N'2025-04-23' AS Date), CAST(42314.43 AS Decimal(10, 2)), N'Activa')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (102, 107, CAST(N'2025-04-23' AS Date), CAST(10.00 AS Decimal(10, 2)), N'Activa')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (103, 107, CAST(N'2025-04-23' AS Date), CAST(1000.00 AS Decimal(10, 2)), N'Activa')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (104, 108, CAST(N'2024-06-15' AS Date), CAST(500.00 AS Decimal(10, 2)), N'Activa')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (105, 109, CAST(N'2025-03-24' AS Date), CAST(400.00 AS Decimal(10, 2)), N'Activa')
INSERT [dbo].[Facturas] ([IdFactura], [IdCliente], [Fecha], [Total], [Estado]) VALUES (106, 111, CAST(N'2025-04-24' AS Date), CAST(145.00 AS Decimal(10, 2)), N'Activa')
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Usuario], [Contraseña], [Rol]) VALUES (1, N'admin', N'admin123', N'Administrador')
INSERT [dbo].[Usuarios] ([IdUsuario], [Usuario], [Contraseña], [Rol]) VALUES (2, N'facturista1', N'fact123', N'Facturación')
INSERT [dbo].[Usuarios] ([IdUsuario], [Usuario], [Contraseña], [Rol]) VALUES (3, N'facturista2', N'fact123', N'Facturación')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Facturas] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Facturas]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCliente]
    @IdCliente INT,
    @Nombre NVARCHAR(100),
    @Correo NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    UPDATE Clientes
    SET Nombre = @Nombre,
        Correo = @Correo,
        Telefono = @Telefono
    WHERE IdCliente = @IdCliente;
END;
GO
/****** Object:  StoredProcedure [dbo].[BuscarCliente]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarCliente]
		@Buscar VARCHAR(70)
AS
BEGIN
	SELECT * FROM Clientes where Nombre LIKE @Buscar + '%'; 
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCliente] --Eliminacion logica en lugar de fisica para no borrar regisgtros importantes 
    @IdCliente INT
AS
BEGIN
    UPDATE Clientes
    SET Estado = 'Inactivo'
    WHERE IdCliente = @IdCliente;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarCliente]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarCliente]
    @Nombre NVARCHAR(100),
    @Correo NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO Clientes (Nombre, Correo, Telefono, Estado)
    VALUES (@Nombre, @Correo, @Telefono,'Activo');
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientes]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientes]
AS
BEGIN
    SELECT * FROM Clientes;
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarDetalleFactura]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarDetalleFactura]
	@IdFactura INT,
	@Descripción VARCHAR(100),
	@Cantidad INT,
	@Precio Decimal(10,2)
AS
BEGIN
	INSERT INTO DetalleFactura(IdFactura, Descripción, Cantidad, Precio)
	VALUES
	(
		@IdFactura,
		@Descripción,
		@Cantidad,
		@Precio 
	);

	    SELECT SCOPE_IDENTITY() AS IdDetalle;

END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarFactura]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarFactura]
    @IdCliente INT,
    @Fecha DATE,
    @Total DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Facturas (IdCliente, Fecha, Total, Estado)
    VALUES (@IdCliente, @Fecha, @Total, 'Activa');

    SELECT SCOPE_IDENTITY() AS IdFactura;
END;
GO
/****** Object:  StoredProcedure [dbo].[TodasLasFacturas]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TodasLasFacturas]
AS
BEGIN
	select * from Facturas;
END;
GO
/****** Object:  StoredProcedure [dbo].[TodosLosDetallesDeFactura]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TodosLosDetallesDeFactura]
AS 
BEGIN
	SELECT * FROM DetalleFactura;
END;
GO
/****** Object:  StoredProcedure [dbo].[ValidarUsuario]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarUsuario]
    @usuario NVARCHAR(50),
    @contrasena NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Usuarios
    WHERE Usuario = @usuario AND Contraseña = @contrasena;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerFacturasPorCliente]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerFacturasPorCliente]
AS
BEGIN
    SELECT 
        C.Nombre AS Cliente,
        F.IdFactura,
        F.Fecha,
        F.Total,
        F.Estado
    FROM 
        Facturas F
    INNER JOIN 
        Clientes C ON F.IdCliente = C.IdCliente
    ORDER BY 
        C.Nombre, F.Fecha;
END
GO
/****** Object:  StoredProcedure [dbo].[VerFacturasPorPeriodo]    Script Date: 24/04/2025 5:29:13:PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerFacturasPorPeriodo]
AS
BEGIN
    SELECT 
        FORMAT(F.Fecha, 'yyyy-MM') AS Periodo,
        F.IdFactura,
        C.Nombre AS Cliente,
        F.Fecha,
        F.Total,
        F.Estado
    FROM 
        Facturas F
    INNER JOIN 
        Clientes C ON F.IdCliente = C.IdCliente
    ORDER BY 
        FORMAT(F.Fecha, 'yyyy-MM'), F.Fecha;
END
GO
USE [master]
GO
ALTER DATABASE [GestionClientesFacturacion] SET  READ_WRITE 
GO
