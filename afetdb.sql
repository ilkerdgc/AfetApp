USE [master]
GO
/****** Object:  Database [AfetDB]    Script Date: 23.12.2017 11:39:23 ******/
CREATE DATABASE [AfetDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AfetDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AfetDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AfetDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AfetDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AfetDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AfetDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AfetDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AfetDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AfetDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AfetDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AfetDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AfetDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AfetDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AfetDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AfetDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AfetDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AfetDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AfetDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AfetDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AfetDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AfetDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AfetDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AfetDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AfetDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AfetDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AfetDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AfetDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AfetDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AfetDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AfetDB] SET  MULTI_USER 
GO
ALTER DATABASE [AfetDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AfetDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AfetDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AfetDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AfetDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AfetDB]
GO
/****** Object:  Table [dbo].[AfetKategori]    Script Date: 23.12.2017 11:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AfetKategori](
	[AfetKategoriID] [int] NOT NULL,
	[AfetAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_AfetKategori] PRIMARY KEY CLUSTERED 
(
	[AfetKategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Afetler]    Script Date: 23.12.2017 11:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afetler](
	[AfetID] [int] IDENTITY(1,1) NOT NULL,
	[AfetKategoriID] [int] NULL,
	[SeriNo] [nvarchar](13) NULL,
	[GuideNo] [nvarchar](13) NULL,
	[BaslangicTarihi] [datetime] NULL,
	[BitisTarihi] [datetime] NULL,
	[Sure] [int] NULL,
	[AfetTuru] [nvarchar](50) NULL,
	[Il] [nvarchar](50) NULL,
	[Ilce] [nvarchar](50) NULL,
	[Koy] [nvarchar](50) NULL,
	[Mahalle] [nvarchar](50) NULL,
	[Belde] [nvarchar](50) NULL,
	[Neden] [nvarchar](200) NULL,
	[Enlem] [nvarchar](50) NULL,
	[Boylam] [nvarchar](50) NULL,
	[NedenAciklama] [nvarchar](300) NULL,
	[EtkiledigiAlanlar] [nvarchar](200) NULL,
	[Kaynak] [nvarchar](200) NULL,
 CONSTRAINT [PK_Afetler] PRIMARY KEY CLUSTERED 
(
	[AfetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AfetKategori] ([AfetKategoriID], [AfetAdi]) VALUES (1, N'Deprem')
INSERT [dbo].[AfetKategori] ([AfetKategoriID], [AfetAdi]) VALUES (2, N'Sel')
INSERT [dbo].[AfetKategori] ([AfetKategoriID], [AfetAdi]) VALUES (3, N'Heyelan')
INSERT [dbo].[AfetKategori] ([AfetKategoriID], [AfetAdi]) VALUES (4, N'Kaya Düşmesi')
INSERT [dbo].[AfetKategori] ([AfetKategoriID], [AfetAdi]) VALUES (5, N'Yangın')
INSERT [dbo].[AfetKategori] ([AfetKategoriID], [AfetAdi]) VALUES (6, N'Çığ')
SET IDENTITY_INSERT [dbo].[Afetler] ON 

INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (5, 2, NULL, NULL, CAST(N'2017-10-25 00:00:00.000' AS DateTime), CAST(N'2017-10-18 00:00:00.000' AS DateTime), 12, N'Sel', N'Afyonkarahisar', N'Çobanlar', N'Merkez Köyler', N'Göynük Köyü', N'wqe', N'wrweretwer,wrweretwer', N'bcvbcvb', N'cvbcnnn', N'wrweretwer,wrweretwer', N'dsf', N'dsf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (7, 1, NULL, NULL, CAST(N'2017-11-15 00:00:00.000' AS DateTime), CAST(N'2017-11-14 00:00:00.000' AS DateTime), 12, N'Deprem', N'Ankara', N'Ayaş', N'Merkez Köyler', N'Çanıllı Köyü', N'wqe', N'wrweretwer,wrweretwer', N'bcvbcvb', N'cvbcnnn', N'wrweretwer,wrweretwer', N'sdfsdgsdg,dfgfdg', N'sdagfdgdf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (8, 1, NULL, NULL, CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 12, N'Deprem', N'Adana', N'Ceyhan', N'Çarşı', N'Belediyeevleri Mah.', N'wqe', N'wrweretwer,wrweretwer', N'bcvbcvb', N'cvbcnnn', N'wrweretwer,wrweretwer', N'sdfsdgsdg,dfgfdg', N'sdagfdgdf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (9, 6, NULL, NULL, CAST(N'2017-12-22 00:00:00.000' AS DateTime), CAST(N'2017-12-22 00:00:00.000' AS DateTime), 23, N'Çığ', N'Ankara', N'Gölbaşı', N'Merkez Köyler', N'Emirler Köyü', N'qweqwe', N'sdf,112', N'xcvxbzczxb', N'asfafad', N'sdf,112', N'dfgdfg', N'qwrqwrwqrt')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (10, 3, NULL, NULL, CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 10, N'Heyelan', N'Amasya', N'Gümüşhacıköy', N'Merkez Köyler', N'Çavuşköy Köyü', N'qweqwe', N'wrweretwer,wrweretwer', N'bcvbcvb', N'cvbcnnn', N'wrweretwer,wrweretwer', N'dsf', N'sdagfdgdf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (11, 4, N'MHmEM9mR-Mtyl', N'MHmEM9mR-Mtyl', CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 10, N'Kaya Düşmesi', N'Antalya', N'Finike', N'Turunçova', N'Demircilik Mah.', N'asd', N'sdafadfdgfdg,wrweretwer', N'xcvxbzczxb', N'cvbcnnn', N'sdafadfdgfdg,wrweretwer', N'sdfsdgsdg,dfgfdg', N'sdagfdgdf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (13, 5, NULL, NULL, CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 10, N'Yangın', N'Adana', N'Girne', N'Doğankent', N'Bahçelıevler Mah.', N'wqe', N'wrweretwer,wrweretwer', N'bcvbcvb', N'cvbcnnn', N'wrweretwer,wrweretwer', N'sdfsdgsdg,dfgfdg', N'sdagfdgdf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (14, 4, NULL, NULL, CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 12, N'Kaya Düşmesi', N'Balıkesir', N'Balya', N'Ilıca', N'Çay Mah.', N'qweqwe', N'wrweretwer,wrweretwer', N'bcvbcvb', N'dsf', N'wrweretwer,wrweretwer', N'sdfsdgsdg,dfgfdg', N'dsf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (16, 4, NULL, NULL, CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 12, N'Kaya Düşmesi', N'Adana', N'Çukurova', N'Merkez Köyler', N'Fadıl Köyü', N'qweqwe', N'sdf,sdf', N'xcvxbzczxb', N'dsf', N'sdf,sdf', N'dsf', N'dsf')
INSERT [dbo].[Afetler] ([AfetID], [AfetKategoriID], [SeriNo], [GuideNo], [BaslangicTarihi], [BitisTarihi], [Sure], [AfetTuru], [Il], [Ilce], [Koy], [Mahalle], [Belde], [Neden], [Enlem], [Boylam], [NedenAciklama], [EtkiledigiAlanlar], [Kaynak]) VALUES (17, 1, NULL, NULL, CAST(N'2017-12-21 00:00:00.000' AS DateTime), CAST(N'2017-12-21 00:00:00.000' AS DateTime), 12, N'Deprem', N'Adıyaman', N'Çelikhan', N'Merkez Köyler', N'Bozgedik Köyü', N'wqe', N'sdf,wrweretwer', N'bcvbcvb', N'asfafad', N'sdf,wrweretwer', N'sdfsdgsdg,dfgfdg', N'sdagfdgdf')
SET IDENTITY_INSERT [dbo].[Afetler] OFF
ALTER TABLE [dbo].[Afetler]  WITH CHECK ADD  CONSTRAINT [FK_Afetler_AfetKategori] FOREIGN KEY([AfetKategoriID])
REFERENCES [dbo].[AfetKategori] ([AfetKategoriID])
GO
ALTER TABLE [dbo].[Afetler] CHECK CONSTRAINT [FK_Afetler_AfetKategori]
GO
USE [master]
GO
ALTER DATABASE [AfetDB] SET  READ_WRITE 
GO
