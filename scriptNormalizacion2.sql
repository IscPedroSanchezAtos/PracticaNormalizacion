USE [master]
GO
/****** Object:  Database [normalizacion2]    Script Date: 22/07/2022 02:54:03 p. m. ******/
CREATE DATABASE [normalizacion2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'normalizacion2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\normalizacion2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'normalizacion2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\normalizacion2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [normalizacion2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [normalizacion2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [normalizacion2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [normalizacion2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [normalizacion2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [normalizacion2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [normalizacion2] SET ARITHABORT OFF 
GO
ALTER DATABASE [normalizacion2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [normalizacion2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [normalizacion2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [normalizacion2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [normalizacion2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [normalizacion2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [normalizacion2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [normalizacion2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [normalizacion2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [normalizacion2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [normalizacion2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [normalizacion2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [normalizacion2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [normalizacion2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [normalizacion2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [normalizacion2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [normalizacion2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [normalizacion2] SET RECOVERY FULL 
GO
ALTER DATABASE [normalizacion2] SET  MULTI_USER 
GO
ALTER DATABASE [normalizacion2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [normalizacion2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [normalizacion2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [normalizacion2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [normalizacion2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [normalizacion2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'normalizacion2', N'ON'
GO
ALTER DATABASE [normalizacion2] SET QUERY_STORE = OFF
GO
USE [normalizacion2]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 22/07/2022 02:54:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id_articulo] [int] NOT NULL,
	[Name_articulo] [varchar](50) NULL,
	[Num_articulo] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/07/2022 02:54:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_cliente] [int] NOT NULL,
	[Name_cliente] [varchar](50) NULL,
	[Id_estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 22/07/2022 02:54:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id_estado] [int] NOT NULL,
	[Name_estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 22/07/2022 02:54:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[Id_orden] [int] NOT NULL,
	[fecha] [date] NULL,
	[Id_articulo] [int] NULL,
	[Id_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente] FOREIGN KEY([Id_estado])
REFERENCES [dbo].[Estado] ([Id_estado])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_cliente]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_articulo] FOREIGN KEY([Id_articulo])
REFERENCES [dbo].[Articulo] ([Id_articulo])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_articulo]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_clienteOrden] FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[Cliente] ([Id_cliente])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_clienteOrden]
GO
USE [master]
GO
ALTER DATABASE [normalizacion2] SET  READ_WRITE 
GO
