USE [master]
GO
/****** Object:  Database [Forum]    Script Date: 2021-11-22 10:08:49 ******/
CREATE DATABASE [Forum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Forum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Forum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Forum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Forum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Forum] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Forum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Forum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Forum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Forum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Forum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Forum] SET ARITHABORT OFF 
GO
ALTER DATABASE [Forum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Forum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Forum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Forum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Forum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Forum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Forum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Forum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Forum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Forum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Forum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Forum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Forum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Forum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Forum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Forum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Forum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Forum] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Forum] SET  MULTI_USER 
GO
ALTER DATABASE [Forum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Forum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Forum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Forum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Forum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Forum] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Forum] SET QUERY_STORE = OFF
GO
USE [Forum]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CatNom] [varchar](50) NOT NULL,
	[CatDesc] [varchar](500) NOT NULL,
	[CatImg] [varchar](255) NULL,
	[CatActif] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MesId] [int] IDENTITY(1,1) NOT NULL,
	[FK_SujId] [int] NOT NULL,
	[FK_User] [nvarchar](450) NOT NULL,
	[MesTexte] [varchar](8000) NOT NULL,
	[MesDate] [datetime] NOT NULL,
	[MesActif] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sujets]    Script Date: 2021-11-22 10:08:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sujets](
	[SujId] [int] IDENTITY(1,1) NOT NULL,
	[FK_CatId] [int] NOT NULL,
	[FK_User] [nvarchar](450) NOT NULL,
	[SujTitre] [varchar](255) NOT NULL,
	[SujTexte] [varchar](8000) NOT NULL,
	[SujDate] [datetime] NOT NULL,
	[SujVues] [int] NULL,
	[SujActif] [bit] NOT NULL,
 CONSTRAINT [PK_Sujets] PRIMARY KEY CLUSTERED 
(
	[SujId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.10')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'User', N'USER', N'USER')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'60cb55c5-110b-4c69-ae31-d46035cc56e3', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'paul', N'PAUL', N'paul@gmail.com', N'PAUL@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEG4FKxNQY27YsgRjpq8oHV08xq0iFmtGSBj7eInM2lrUvw4790Xd8vo8WvgV+5Hkvw==', N'DF2L3G5GKTXIIMZENHMFQ4XGZVQDCKJB', N'06f6df40-6bd2-4901-ae12-78b9ac4f8598', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'60cb55c5-110b-4c69-ae31-d46035cc56e3', N'bob', N'BOB', N'bob@bob.ca', N'BOB@BOB.CA', 1, N'AQAAAAEAACcQAAAAEJ6qXrY5On8HDxLoHCnfqjVU1Crq3No3Z/gXSnNytBYkdpmzm70CiLHuVRNts4RdJw==', N'7RXAUZEM6RF4QJCZET6VETFILL3QOCIP', N'ca031706-3ee1-4b6a-ac4d-303774ca7708', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'alex', N'ALEX', N'alex@gmail.com', N'ALEX@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEEaDLrkfpLizFaf/9m8c+ou9dUNLsF34t73ZU51qfFGsrMOoa6pX5CfBg6rldIjk6A==', N'MY7J3YIQEKTQRMV7LGFDVPXK6NHE24I5', N'787540ae-e4ea-4231-ad7c-2cbeb574d0b4', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Admin', N'ADMIN', N'admin@amw.ca', N'ADMIN@AMW.CA', 1, N'AQAAAAEAACcQAAAAEGcRLWhZ+GkBLcPr3LidVvtBvyMq9BV0DSd7Q0x3anAiqAWhpkqLeVUseaXdn+xDlA==', N'ATLS75EL3K3SIPE2IO66Q5HDFGEXZWMJ', N'874935ed-1b7a-44aa-9e69-afd979bd31ba', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'jean', N'JEAN', N'jean@gmail.com', N'JEAN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEDlie9DszngX7JlE79VB4b7If28tiQDDaxIhsvq33oZhfDtvKdoMt78A2H4fnvc7UA==', N'TWJA57ADMADMMLP4OOK7C4MHVUQARYS6', N'30e9218b-123c-4b47-b140-e80a4ecaaff5', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (1, N'Bassistes', N'Discussions sur les bassistes influents, tout genre confondu.', N'\assets\img\bass\jaco.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (2, N'L''instrument', N'Discussions sur la basse et les éléments physiques qui la composent.', N'\assets\img\bass\james.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (4, N'Amplification', N'Discussions sur l''aspect sonore de la basse et l''amplification', N'\assets\img\bass\ampeg.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (6, N'Micros et pièces électroniques', N'Discussions sur les micros et les pièces électroniques qui font partie de la basse.', N'\assets\img\bass\bassred.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (7, N'Cordes', N'Discussions sur les types de cordes utilisés pour la basse.', N'\assets\img\bass\corde.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (8, N'Effets', N'Discussions sur les effets, pédales et accessoires pour modifier le son de la basse.', N'\assets\img\bass\pedals.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (9, N'Enregistrement', N'Discussions sur les méthodes et les équipements d''enregistrement studio de la basse.', N'\assets\img\bass\bassrecord.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (10, N'Tablatures et partitions', N'Discussions et échanges sur les partitions pour la basse.', N'\assets\img\bass\bassclef.jpg', 0)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (11, N'Techniques', N'Discussions sur les différentes techniques utilisées pour jouer de la basse.', N'\assets\img\bass\slap.jpg', 1)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (15, N'TestCat', N'BlaBlaBla', N'https://images.app.goo.gl/DASan6KQHTmRqZGq9', 0)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (26, N'MasterClass', N'<p>MasterClass à venir...</p>', NULL, 0)
INSERT [dbo].[Categories] ([CatId], [CatNom], [CatDesc], [CatImg], [CatActif]) VALUES (27, N'Partitions 2', N'<p>Plus de partitions et tablatures</p>', NULL, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (1, 3, N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'Les flatwounds pour le slap, comment ça sonne?', CAST(N'2021-10-02T12:09:00.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (2, 2, N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'Jaco se plaignait du peu de concert qu''il avait vers la fin de sa vie...', CAST(N'2021-10-03T23:26:00.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (3, 2, N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'En juillet, il est interné à l''hôpital psychiatrique Bellevue (New York). En décembre, il retourne en Floride, habite un temps chez son père avant de reprendre une vie de semi-clochard. Il est régulièrement arrêté par la police, et « interdit de séjour » dans de nombreux clubs de jazz. ', CAST(N'2021-10-07T01:46:02.750' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (4, 8, N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'Oui, je l''ai, c''est vraiment de la bombe!!', CAST(N'2021-10-08T03:43:28.403' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (5, 8, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Il parait qu''il a 18 volts sur l''option active... C''est excellent pour le son slap!', CAST(N'2021-10-08T03:45:14.107' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (6, 4, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Ça dépend de ton utilisation... le combo B45 est suffisant pour supporter le son avec un batteur dans le local de pratique mais pas vraiment assez ouissant pour la scène.', CAST(N'2021-10-08T03:47:31.543' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (7, 7, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Je viens de visionner le documentaire sur Marcus Miller et c''est top! Il y présente un masterclass dans lequel il montre sa technique, c''est incroyable!', CAST(N'2021-10-08T03:49:52.750' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (8, 10, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'<p>Ça fait des années que je suis satisfait de mon cabinet Ampeg de 4 10 pouces. Des basses à volonté, du punch et de la précision...</p>', CAST(N'2021-10-09T23:51:41.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (9, 10, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'<p>Le 15 pouces va vraiment être excellent pour les sub-bass et si t''as une basse 5 cordes bien sûr.</p>', CAST(N'2021-10-09T23:57:31.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (10, 8, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'<p>Il parait qu''il a 18 volts sur l''option active. C''est excellent pour le son slap</p>', CAST(N'2021-10-10T00:10:06.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (11, 3, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Ben flat!', CAST(N'2021-10-10T22:56:46.697' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (12, 15, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'Il y a beaucoup plus d''options sur l''ElectroOmni, des synth et un looper. Par contre le MXR est très réputé pour la fiabilité et la durabilité.', CAST(N'2021-10-15T14:30:58.723' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (13, 11, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'C''est un artiste et musicien compositeur exceptionnel qui a relevé le défi avec brio. Il peut s''inspirer de tout pour créer.', CAST(N'2021-10-15T22:25:21.117' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (14, 13, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'Un ''si'' grave et un ''do aigu''. ', CAST(N'2021-10-15T23:23:55.763' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (15, 14, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'J''adore les Fender!', CAST(N'2021-10-17T14:35:13.580' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (16, 27, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'<p>Plus bas SVP Ginette...</p>', CAST(N'2021-11-10T00:35:23.003' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (17, 27, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'<p>Plus bas SVP Ginette...</p>', CAST(N'2021-11-10T00:35:38.583' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (18, 27, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'<p>Vraiment plus bas SVP Ginette... t''es capable.</p>', CAST(N'2021-11-10T00:36:50.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (19, 27, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'<p>Vraiment vraiment plus bas SVP Ginette...</p>', CAST(N'2021-11-10T00:37:17.343' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (20, 34, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'<p>C''est parce que le toggle de la pédale active le processeur pour faire varier les fréquence de l''instrument. Le son de la basse qui sort de la pédale n''est plus le son d''origine. Ça se produit avec beaucoup de pédales...</p>', CAST(N'2021-11-10T01:26:38.480' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (21, 27, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'<blockquote>
<p style="text-align: center;"><span style="text-decoration: underline;"><strong><em><span style="color: #569cd6; font-family: SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, monospace;"><span style="font-size: 14px; white-space: pre; background-color: #2f2f2f;">Et pourquoi pas, elle est bien meilleure que Céline...</span></span></em></strong></span></p>
</blockquote>', CAST(N'2021-11-13T00:21:35.623' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (22, 27, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'<h2 style="text-align: center;">Et pourquoi pas, elle est bien meilleure que Céline...</h2>', CAST(N'2021-11-13T00:22:28.400' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (23, 36, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'<p>Robert Johnson, <em><strong>je pense...</strong></em></p>', CAST(N'2021-11-17T23:26:37.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (24, 11, N'60cb55c5-110b-4c69-ae31-d46035cc56e3', N'<p>Il est super!</p>', CAST(N'2021-11-18T01:00:19.000' AS DateTime), 1)
INSERT [dbo].[Messages] ([MesId], [FK_SujId], [FK_User], [MesTexte], [MesDate], [MesActif]) VALUES (25, 38, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'<p>Pas sur de ça, faudrait demander à Samuel...</p>', CAST(N'2021-11-18T02:15:13.057' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Sujets] ON 

INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (2, 1, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Jaco Pastorius', N'Jaco : la déchéance de la fin de sa courte vie.', CAST(N'2021-10-03T00:18:00.000' AS DateTime), 6, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (3, 7, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Avis sur les flatwounds 2', N'Petit guide d''achat et avis sur les marques qui fabriquent des cordes flatwounds', CAST(N'2021-10-01T21:36:00.000' AS DateTime), 4, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (4, 4, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Ampeg SVG ou combo?', N'J''aimerais un avis sur ces deux type d''ampli Ampeg pour un achat futur. Merci!', CAST(N'2021-10-03T10:29:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (7, 1, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Marcus Miller', N'Le pro de la slap: un son clair et un rythme précis...', CAST(N'2021-10-04T22:50:00.000' AS DateTime), 6, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (8, 6, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'EMG soapbar', N'Le nouveau micro EMG Soapbar est enfin disponible! Quelqu''un l''a essayé?', CAST(N'2021-10-06T22:26:00.000' AS DateTime), 17, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (10, 4, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Cabinet de quatre 10 pouces ou un de 15 pouces?', N'<p>Je ne sais que choisir comme config . Je suppose que plus c''est gros, plus ça fait de basses fréquences?</p>', CAST(N'2021-10-08T14:27:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (11, 1, N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'Micheal League', N'Il est présentement à bosser sur un nouveau projet qui allie la nourriture à la musique. Vous en pensez-quoi?', CAST(N'2021-10-08T09:27:00.000' AS DateTime), 18, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (13, 2, N'306d2e50-57be-417b-aa3c-6742e45b4b00', N'Basse 6 cordes', N'Quelles sont les notes des cordes ajoutées sur une six cordes?', CAST(N'2021-10-14T07:28:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (14, 1, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'Fender', N'Est-ce que la Fender Precision est le meilleur modèle pour un son funk ''70?', CAST(N'2021-10-14T13:42:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (15, 8, N'fa1174bb-3db9-4e70-86c5-8ad26f27f36b', N'Octaver', N'J''hésites entre le MXR ou l''ElectroOmni, quelqu''un peut m''orienter?', CAST(N'2021-10-15T14:28:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (26, 1, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Ginette Reno', N'<p>Elle peut chanter tr&egrave;s bas....</p>', CAST(N'2021-11-09T00:52:59.000' AS DateTime), 2, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (27, 1, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Ginette Reno', N'<p>Elle peut chanter très bas....</p>', CAST(N'2021-11-09T01:01:48.000' AS DateTime), 26, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (28, 9, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Comment s''enregistrer avec deux sources?', N'<p>J''aime bien le son de la DI mais j''amerais explorer avec le micro devant l''ampli.... Des conseils?</p>', CAST(N'2021-11-09T01:11:31.507' AS DateTime), 4, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (29, 2, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Les basses sans tête', N'<p>Non... voyons, jamais de la vie dans cent ans!</p>', CAST(N'2021-11-09T09:21:08.000' AS DateTime), 4, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (30, 4, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Eq', N'<p>Quelle est le meilleur EQ d''ampli pour la musique latine?</p>', CAST(N'2021-11-09T10:41:40.733' AS DateTime), 2, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (31, 6, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Jack input 1/4 brisé', N'<p>Comment changer un input de jack 1/4...?</p>', CAST(N'2021-11-09T10:53:58.000' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (32, 2, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Basse Ukulele', N'<p>Est-ce qu''une basse Ukulele est convenable pour un enfant de 3 ans?</p>', CAST(N'2021-11-09T13:30:45.000' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (33, 2, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Fretless?', N'<p>Comment on transforme une basse fretté en fretless?</p>', CAST(N'2021-11-09T14:44:35.083' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (34, 8, N'630376a7-0288-405f-91a6-8cf62a5ac66f', N'Wha wha', N'<p>Pourquoi les basses fréquences diminuent quand j''enclenche mon wha-wha?</p>', CAST(N'2021-11-10T01:22:47.510' AS DateTime), 1, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (35, 1, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Les Claypool', N'<p>Complètement fou ce bassiste !</p>', CAST(N'2021-11-12T23:48:42.987' AS DateTime), NULL, 1)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (36, 11, N'60cb55c5-110b-4c69-ae31-d46035cc56e3', N'Qui a inventé le slap?', N'<p>C''est un génie, je veux savoir c''est qui, bon!</p>', CAST(N'2021-11-17T22:45:19.000' AS DateTime), 26, 0)
INSERT [dbo].[Sujets] ([SujId], [FK_CatId], [FK_User], [SujTitre], [SujTexte], [SujDate], [SujVues], [SujActif]) VALUES (38, 11, N'8501a32a-332f-44b6-81d4-83385c5a7b40', N'Qui a créé le slap?', N'<p>John Doe??</p>', CAST(N'2021-11-18T02:14:39.603' AS DateTime), 6, 1)
SET IDENTITY_INSERT [dbo].[Sujets] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2021-11-22 10:08:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2021-11-22 10:08:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2021-11-22 10:08:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2021-11-22 10:08:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2021-11-22 10:08:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2021-11-22 10:08:49 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2021-11-22 10:08:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AspNetUsers] FOREIGN KEY([FK_User])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AspNetUsers]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Sujets] FOREIGN KEY([FK_SujId])
REFERENCES [dbo].[Sujets] ([SujId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Sujets]
GO
ALTER TABLE [dbo].[Sujets]  WITH CHECK ADD  CONSTRAINT [FK_Sujets_AspNetUsers] FOREIGN KEY([FK_User])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Sujets] CHECK CONSTRAINT [FK_Sujets_AspNetUsers]
GO
ALTER TABLE [dbo].[Sujets]  WITH CHECK ADD  CONSTRAINT [FK_Sujets_Categories] FOREIGN KEY([FK_CatId])
REFERENCES [dbo].[Categories] ([CatId])
GO
ALTER TABLE [dbo].[Sujets] CHECK CONSTRAINT [FK_Sujets_Categories]
GO
USE [master]
GO
ALTER DATABASE [Forum] SET  READ_WRITE 
GO
