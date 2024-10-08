USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 13/9/2024 19:58:21 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'D:\Luly\INFO 2024\TP07_Dominguez_Minuchin\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'¨reguntadORT_log', FILENAME = N'D:\Luly\INFO 2024\TP07_Dominguez_Minuchin\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/9/2024 19:58:22 ******/
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
/****** Object:  Table [dbo].[Dificultades]    Script Date: 13/9/2024 19:58:22 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 13/9/2024 19:58:22 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 13/9/2024 19:58:22 ******/
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
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Arte', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Ciencia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Deporte', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Entretenimiento', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Geografia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (6, N'Historia', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDifucultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultades] ([IdDifucultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IdDifucultad], [Nombre]) VALUES (3, N'Difícil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 5, 1, N'¿Cuál es el río más largo del mundo?', N'https://www.ngenespanol.com/wp-content/uploads/2023/08/nilo-o-amazonas-cual-es-el-rio-mas-largo-del-mundo-1024x573.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 5, 2, N'¿Cuál es el país más grande del mundo por superficie?', N'https://www.enter.co/wp-content/uploads/2023/07/PLANETA-1104x621.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 5, 3, N'¿Cuál es la capital de Australia?', N'https://fotos.perfil.com//2022/08/24/900/0/australia-20220824-1407288.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 5, 1, N'¿Qué océano es el más grande?', N'https://www.launion.com.mx/media/k2/items/cache/de3f6411c3a27777fe7fdb7ad0ea4b13_XL.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 5, 2, N'¿En qué continente se encuentra el desierto del Sahara?', N'https://assets.saposyprincesas.com/2021/05/curiosidades-del-desierto-del-sahara-erg-chebbi.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 5, 3, N'¿Cuál es la montaña más alta del mundo?', N'https://www.mountainblog.it/wp-content/uploads/2018/06/614px511-Gasherbrum-IV-fonte-h-barmasse.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 5, 1, N'¿Qué país tiene la mayor población del mundo?', N'https://ekosnegocios.com/image/posts/June2021/8aUsMGD5oNco9ODaDSQt.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 5, 2, N'¿Qué país europeo tiene forma de bota?', N'https://static.vecteezy.com/system/resources/previews/010/795/143/non_2x/italy-map-with-region-borders-illustration-vector.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 5, 3, N'¿Cuál es la capital de Japón?', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSRvNmN3Y7bOSppqhNeTUv2x_5yOnC6nYH3ZuS2nCCzvkU9DsaF')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 2, 2, N'¿Cuál es el elemento químico más abundante en la Tierra?', N'https://upload.wikimedia.org/wikipedia/commons/7/76/Periodic_table_large_2016-es.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 2, 1, N'¿Qué planeta es conocido como el planeta rojo?', N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSsMA8dpUHposzTXyfd8foDhtkR78c1DM8YErkS4AI5lYav7wXc')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 2, 3, N'¿Cuál es la velocidad de la luz?', N'https://t3.ftcdn.net/jpg/01/67/08/06/360_F_167080612_avf8BIhL7HDNdhG8O3JTK42HL8cvKAuk.webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 2, 2, N'¿Quién formuló la teoría de la relatividad?', N'https://cdn.businessinsider.es/sites/navi.axelspringer.es/public/media/image/2023/03/teorias-einstein-2989094.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 2, 1, N'¿Qué vitamina es producida en la piel en respuesta a la luz solar?', N'https://sinalefa2.wordpress.com/wp-content/uploads/2011/07/rayossol.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 2, 3, N'¿Cuál es la molécula portadora de energía en las células?', N'https://media.istockphoto.com/id/530530505/es/foto/e-iguales-mc-al-cuadrado.webp?b=1&s=170667a&w=0&k=20&c=6hDaaouuvUxBFuTpwCJwfx9Fb2IiXjpWLLgLku0OELo=')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 2, 2, N'¿Qué gas es esencial para la respiración humana?', N'https://static.vecteezy.com/system/resources/previews/002/181/675/non_2x/respiratory-breathing-system-body-organ-anatomy-diagram-drawing-vector.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 2, 1, N'¿Cuál es el órgano más grande del cuerpo humano?', N'https://content.cuerpomente.com/medio/2024/06/27/organos-del-cuerpo-humano_186ac590_240627003013_1200x630.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 2, 3, N'¿Qué científico propuso la teoría de la evolución por selección natural?', N'https://ccfprosario.com.ar/wp-content/uploads/cuantas-teorias-tiene-charles-darwin.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 4, 1, N'¿Quién escribió la serie de libros "Harry Potter"?', N'https://www.clarin.com/2020/05/07/vE2mMflIT_720x0__1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 4, 2, N'¿En qué año se estrenó la primera película de Star Wars?', N'https://media.revistagq.com/photos/5f760cf2851d170f9d93eb63/16:9/w_2560,c_limit/adidas-star-wars-empire-strikes-back.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 4, 3, N'¿Quién interpretó a Jack en "Titanic"?', N'https://hips.hearstapps.com/hmg-prod/images/titanic-jack-rose-leonardo-dicaprio-kate-winslet-1672821470.jpg?crop=0.899xw:1.00xh;0.0636xw,0&resize=768:*')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 4, 2, N'¿Cuál es la película animada más taquillera de todos los tiempos?', N'https://www.industriaanimacion.com/wp-content/uploads/2022/09/mejores_peliculas_animadas_en_disney_plus_opt.webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 4, 1, N'¿Qué superhéroe es conocido como "el Hombre Murciélago"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 4, 3, N'¿Qué serie de televisión presenta a un grupo de sobrevivientes en una isla?', N'https://www.lanacion.com.ar/resizer/v2/-UGXG4M5SOBBMFEZA6U5UGPSQNA.jpg?auth=202aeaa8f08cc36a087803c763a6270cf5595e98f483eb8a1f5855f22a2147dc&width=880&height=586&quality=70&smart=true')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (25, 4, 1, N'¿Quién es el creador del personaje de Mickey Mouse?', N'https://samsdisneydiary.com/wp-content/uploads/2023/10/1697487978_New-Walt-Disney-Mickey-Mouse-Statue-Debuts-at-Hong-1200x900.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (26, 4, 2, N'¿En qué película aparece el personaje "Forrest Gump"?', N'https://www.quever.news/u/fotografias/m/2023/5/26/f1280x720-52408_184083_6132.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (27, 4, 3, N'¿Cuál es la película más taquillera de la historia?', N'https://chajarialdia.com.ar/wp-content/uploads/2024/05/Dia-del-cine-1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (28, 3, 1, N'¿Cuál es el deporte más popular del mundo?', N'https://lasflores.gob.ar/wp-content/uploads/2024/03/138077-1024x668.webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (29, 3, 2, N'¿Quién es el atleta con más medallas olímpicas?', N'https://fotografias.lasexta.com/clipping/cmsimages02/2024/07/31/7352FDE3-B91B-4403-9FD4-E4A1C8287770/imagen-medallas-oro-plata-bronce-juegos-olimpicos-paralimpicos-2024_97.jpg?crop=5396,3035,x0,y280&width=1600&height=900&optimize=low&format=webply')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (30, 3, 3, N'¿En qué país se originó el béisbol?', N'https://www.bloomberglinea.com/resizer/v2/RTOM2XKFUVGLFGDDIQZGPB6B5E.jpg?auth=7648ea59301f6e4e66e55e62d6bbd351896081e4c015b1c0a27a56855a473233&width=800&height=523&quality=80&smart=true')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (31, 3, 2, N'¿Qué país ha ganado más Copas del Mundo de Fútbol?', N'https://phantom-marca.unidadeditorial.es/16c0a65947c650d0c77a0208528a5be3/resize/828/f/webp/assets/multimedia/imagenes/2023/10/04/16964338538264.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (32, 3, 3, N'¿Qué deporte se juega con una pelota ovalada?', N'https://www.aplenorugby.com.ar/images/galeria/Pelota_LosTeros-Jul16_HOME.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (33, 3, 1, N'¿Qué país alberga el torneo de tenis de Wimbledon?', N'https://idawen.com/blog/wp-content/uploads/2018/04/tenis-wimbledon-portada.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (34, 3, 2, N'¿Qué jugador de baloncesto es conocido como "Su Majestad del Aire"?', N'https://www.rockstaracademy.com/lib/images/news/basketball.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (35, 3, 3, N'¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', N'https://media.admagazine.com/photos/638118cb0bd425d9f44202a6/16:9/w_1920,c_limit/Bandera-juegos-oli%CC%81mpicos.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (36, 3, 1, N'¿Qué deporte es conocido como "el deporte blanco"?', N'https://s.france24.com/media/display/6aca8d1a-7783-11ea-9cf2-005056bf87d6/w:1280/p:4x3/WEB%2005ABR%20DEPORTES%20PORTADA%20FOTO.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (37, 6, 1, N'¿Quién fue el primer presidente de los Estados Unidos?', N'https://www.infobae.com/new-resizer/MRpKzef27ban1RLklBh0TP1Ntfk=/992x558/filters:format(webp):quality(85)/arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/ZTPC2VYFPFDIHBJ34LOQICTO7I.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (38, 6, 2, N'¿En qué año comenzó la Segunda Guerra Mundial?', N'https://media.cnn.com/api/v1/images/stellar/prod/cnne-1042162-segunda-guerra-mundial.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (39, 6, 3, N'¿Quién fue el líder de la Revolución Rusa en 1917?', N'https://www.elviejotopo.com/wp-content/uploads/2017/11/Lenin-3.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (40, 6, 1, N'¿Cuál es el país más antiguo del mundo?', N'https://billiken.lat/wp-content/uploads/2024/02/dt-23.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (41, 6, 2, N'¿Qué emperador romano legalizó el cristianismo?', N'https://images.ecestaticos.com/wvKO6X0GK4vXzEfPChdeKBo6484=/0x0:795x701/600x450/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F01b%2F790%2F5ed%2F01b7905ed28599a9274d31eb334ff14d.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (42, 6, 3, N'¿Qué país fue conocido como Persia?', N'https://economiahistorica.com/wp-content/uploads/economia-de-la-antigua-persia-1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (43, 6, 1, N'¿Qué gran civilización construyó las pirámides de Giza?', N'https://blog-egipto.com/wp-content/uploads/2009/05/piramides_giza.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (44, 6, 3, N'¿En qué año cayó el Muro de Berlín?', N'https://izquierdaweb.com/wp-content/uploads/2021/11/Muro-de-Berlin.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (45, 6, 2, N'¿Quién fue el denominado "descubridor de América?"', N'https://ar.usembassy.gov/wp-content/uploads/sites/111/2023/02/02388v.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (46, 1, 1, N'¿Quién pintó la Mona Lisa?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Leonardo_da_Vinci_-_Mona_Lisa_%28Louvre%2C_Paris%29.jpg/368px-Leonardo_da_Vinci_-_Mona_Lisa_%28Louvre%2C_Paris%29.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (47, 1, 2, N'¿En qué museo se encuentra la pintura "La Noche Estrellada"?', N'https://historiauniversal.org/wp-content/uploads/la-noche-estrellada.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (48, 1, 1, N'¿Qué famoso pintor es conocido por haber cortado su propia oreja?', N'https://historia-arte.com/_/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpbSI6WyJcL2FydHdvcmtcL2ltYWdlRmlsZVwvNjBhZTE4MjVhNDZmYS5qcGciLCJyZXNpemUsMTUwMHxmb3JtYXQsd2VicCJdfQ.EamMhbhjEdNHkQqg8y1XUwNV6srIN8upq82S_uuLZTs.webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (49, 1, 3, N'¿Quién pintó el "Guernica"?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Mural_del_Gernika.jpg/495px-Mural_del_Gernika.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (50, 1, 2, N'¿Qué estilo artístico es Salvador Dalí más conocido por haber practicado?', N'https://www.elsoldemexico.com.mx/cultura/wo8gik-salvador-dali.jpg/alternates/LANDSCAPE_768/Salvador%20Dal%C3%AD.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (51, 1, 3, N'¿Qué pintor es conocido por la serie "Los Girasoles"?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Vincent_Willem_van_Gogh_128.jpg/375px-Vincent_Willem_van_Gogh_128.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (52, 1, 1, N'¿Qué artista pintó el techo de la Capilla Sixtina?', N'https://www.worldhistory.org/img/r/p/1500x1500/12580.jpg.webp?v=1722002533')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (53, 1, 2, N'¿Qué movimiento artístico fue fundado por Georges Braque y Pablo Picasso?', N'https://anagarciaherraez.blog/wp-content/uploads/art/1972/pj77f70j5l.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (54, 1, 3, N'¿Qué artista es conocido por su obra "El Grito"?', N'https://hips.hearstapps.com/hmg-prod/images/the-scream-tempera-and-pastel-on-wood-1893-one-of-four-news-photo-1721646340.jpg?resize=980:*')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (2, 1, 1, 0, N'Nilo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (3, 1, 2, 1, N'Amazonas', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (4, 1, 3, 0, N'Yangtsé', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (5, 2, 1, 0, N'Canadá', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (6, 2, 2, 0, N'Estados Unidos', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (7, 2, 3, 1, N'Rusia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (8, 3, 1, 0, N'Sydney', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (9, 3, 2, 1, N'Canberra', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (10, 3, 3, 0, N'Melbourne', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (11, 4, 1, 0, N'Atlántico', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (12, 4, 2, 0, N'Índico', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (13, 4, 3, 1, N'Pacífico', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (14, 5, 1, 1, N'África', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (15, 5, 2, 0, N'Asia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (16, 5, 3, 0, N'Australia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (17, 6, 1, 0, N'K2', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (18, 6, 2, 1, N'Everest', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (19, 6, 3, 0, N'Kangchenjunga', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (20, 7, 1, 0, N'India', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (21, 7, 2, 1, N'China', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (22, 7, 3, 0, N'Estados Unidos', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (23, 8, 1, 1, N'Italia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (24, 8, 2, 0, N'España', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (25, 8, 3, 0, N'Grecia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (26, 9, 1, 0, N'Osaka', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (27, 9, 2, 1, N'Tokio', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (28, 9, 3, 0, N'Kioto', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (56, 10, 1, 1, N'Hidrógeno', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (57, 10, 2, 0, N'Oxígeno', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (58, 10, 3, 0, N'Hierro', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (59, 11, 1, 0, N'Júpiter', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (60, 11, 2, 1, N'Marte', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (61, 11, 3, 0, N'Saturno', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (62, 12, 1, 0, N'300,000 km/s', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (63, 12, 2, 1, N'299,792 km/s', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (64, 12, 3, 0, N'310,000 km/s', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (65, 13, 1, 0, N'Isaac Newton', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (66, 13, 2, 1, N'Albert Einstein', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (67, 13, 3, 0, N'Galileo Galilei', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (68, 14, 1, 1, N'Vitamina D', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (69, 14, 2, 0, N'Vitamina C', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (70, 14, 3, 0, N'Vitamina B12', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (71, 15, 1, 0, N'ADN', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (72, 15, 2, 1, N'ATP', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (73, 15, 3, 0, N'ARN', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (74, 16, 1, 1, N'Oxígeno', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (75, 16, 2, 0, N'Dióxido de carbono', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (76, 16, 3, 0, N'Nitrógeno', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (77, 17, 1, 0, N'Corazón', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (78, 17, 2, 1, N'Piel', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (79, 17, 3, 0, N'Hígado', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (80, 18, 1, 0, N'Gregor Mendel', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (81, 18, 2, 1, N'Charles Darwin', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (82, 18, 3, 0, N'Louis Pasteur', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (83, 19, 1, 0, N'George R.R. Martin', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (84, 19, 2, 1, N'J.K. Rowling', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (85, 19, 3, 0, N'J.R.R. Tolkien', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (86, 20, 1, 1, N'1977', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (87, 20, 2, 0, N'1980', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (88, 20, 3, 0, N'1983', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (89, 21, 1, 0, N'Brad Pitt', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (90, 21, 2, 1, N'Leonardo DiCaprio', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (91, 21, 3, 0, N'Tom Cruise', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (92, 22, 1, 0, N'Frozen', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (93, 22, 2, 1, N'El Rey León (2019)', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (94, 22, 3, 0, N'Toy Story 4', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (95, 23, 1, 1, N'Batman', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (96, 23, 2, 0, N'Superman', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (97, 23, 3, 0, N'Spider-Man', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (98, 24, 1, 0, N'Breaking Bad', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (99, 24, 2, 0, N'Game of Thrones', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (100, 24, 3, 1, N'Lost', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (101, 25, 1, 1, N'Walt Disney', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (102, 25, 2, 0, N'Hanna-Barbera', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (103, 25, 3, 0, N'Tex Avery', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (104, 26, 1, 0, N'El Náufrago', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (105, 26, 2, 1, N'Forrest Gump', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (106, 26, 3, 0, N'Apolo 13', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (107, 27, 1, 0, N'Avatar', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (108, 27, 2, 1, N'Avengers: Endgame', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (109, 27, 3, 0, N'Titanic', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (110, 28, 1, 0, N'Baloncesto', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (111, 28, 2, 1, N'Fútbol', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (112, 28, 3, 0, N'Tenis', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (113, 29, 1, 0, N'Usain Bolt', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (114, 29, 2, 1, N'Michael Phelps', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (115, 29, 3, 0, N'Carl Lewis', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (116, 30, 1, 0, N'Inglaterra', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (117, 30, 2, 1, N'Estados Unidos', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (118, 30, 3, 0, N'Japón', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (119, 31, 1, 0, N'Argentina', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (120, 31, 2, 0, N'Alemania', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (121, 31, 3, 1, N'Brasil', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (122, 32, 1, 1, N'Rugby', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (123, 32, 2, 0, N'Béisbol', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (124, 32, 3, 0, N'Balonmano', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (125, 33, 1, 1, N'Reino Unido', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (126, 33, 2, 0, N'Australia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (127, 33, 3, 0, N'Estados Unidos', NULL)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (128, 34, 1, 1, N'Michael Jordan', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (129, 34, 2, 0, N'LeBron James', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (130, 34, 3, 0, N'Kobe Bryant', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (131, 35, 1, 1, N'1896', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (132, 35, 2, 0, N'1900', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (133, 35, 3, 0, N'1924', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (137, 37, 1, 0, N'Thomas Jefferson', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (138, 37, 2, 1, N'George Washington', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (139, 37, 3, 0, N'John Adams', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (140, 38, 1, 0, N'1938', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (141, 38, 2, 0, N'1940', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (142, 38, 3, 1, N'1939', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (143, 39, 1, 0, N'Joseph Stalin', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (144, 39, 2, 0, N'Leon Trotsky', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (145, 39, 3, 1, N'Vladimir Lenin', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (146, 40, 1, 1, N'Egipto', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (147, 40, 2, 0, N'China', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (148, 40, 3, 0, N'Grecia', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (149, 41, 1, 1, N'Constantino', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (150, 41, 2, 0, N'Julio César', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (151, 41, 3, 0, N'Nerón', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (152, 42, 1, 0, N'Egipto', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (153, 42, 2, 1, N'Irán', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (154, 42, 3, 0, N'Turquía', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (155, 43, 1, 1, N'Egipto', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (156, 43, 2, 0, N'Mayas', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (157, 43, 3, 0, N'Aztecas', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (158, 44, 1, 1, N'1989', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (159, 44, 2, 0, N'1991', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (160, 44, 3, 0, N'1987', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (161, 45, 1, 1, N'Cristóbal Colón', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (162, 45, 2, 0, N'Americo Vespucio', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (163, 45, 3, 0, N'Leif Erikson', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (191, 46, 1, 1, N'Leonardo da Vinci', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (192, 46, 2, 0, N'Pablo Picasso', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (193, 46, 3, 0, N'Vincent van Gogh', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (194, 47, 1, 0, N'Museo del Louvre', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (195, 47, 2, 1, N'Museo de Arte Moderno de Nueva York', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (196, 47, 3, 0, N'Galería Uffizi', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (197, 48, 1, 0, N'Claude Monet', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (198, 48, 2, 1, N'Vincent van Gogh', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (199, 48, 3, 0, N'Salvador Dalí', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (200, 49, 1, 0, N'Henri Matisse', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (201, 49, 2, 0, N'Salvador Dalí', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (202, 49, 3, 1, N'Pablo Picasso', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (203, 50, 1, 1, N'Surrealismo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (204, 50, 2, 0, N'Cubismo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (205, 50, 3, 0, N'Impresionismo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (206, 51, 1, 0, N'Paul Gauguin', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (207, 51, 2, 1, N'Vincent van Gogh', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (208, 51, 3, 0, N'Claude Monet', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (209, 52, 1, 1, N'Miguel Ángel', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (210, 52, 2, 0, N'Leonardo da Vinci', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (211, 52, 3, 0, N'Rafael', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (212, 53, 1, 0, N'Futurismo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (213, 53, 2, 1, N'Cubismo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (214, 53, 3, 0, N'Expresionismo', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (215, 54, 1, 1, N'Edvard Munch', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (216, 54, 2, 0, N'Gustav Klimt', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (217, 54, 3, 0, N'Francisco Goya', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (218, 36, 1, 0, N'Golf', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (219, 36, 2, 1, N'Tenis', NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Correcta], [Contenido], [Foto]) VALUES (220, 36, 3, 0, N'Rugby', NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
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
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
