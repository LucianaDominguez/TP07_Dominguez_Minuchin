USE [master]
GO
/****** Object:  Database [ PreguntadOrt]    Script Date: 26/8/2024 08:39:00 ******/
CREATE DATABASE [ PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'D:\Luly\INFO 2024\TP07_Dominguez_Minuchin\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'¨reguntadORT_log', FILENAME = N'D:\Luly\INFO 2024\TP07_Dominguez_Minuchin\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [ PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [ PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N' PreguntadOrt', N'ON'
GO
ALTER DATABASE [ PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [ PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 26/8/2024 08:39:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 26/8/2024 08:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](300) NOT NULL,
	[Foto] [text] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 26/8/2024 08:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDifucultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDifucultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 26/8/2024 08:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](300) NOT NULL,
	[Foto] [text] NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 26/8/2024 08:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Contenido] [varchar](300) NOT NULL,
	[Foto] [text] NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDifucultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [ PreguntadOrt] SET  READ_WRITE 
GO
