USE [master]
GO
/****** Object:  Database [nursingHome]    Script Date: 6/7/2022 3:56:46 PM ******/
CREATE DATABASE [nursingHome]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nursingHome', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\nursingHome.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nursingHome_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\nursingHome_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nursingHome].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nursingHome] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nursingHome] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nursingHome] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nursingHome] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nursingHome] SET ARITHABORT OFF 
GO
ALTER DATABASE [nursingHome] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nursingHome] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nursingHome] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nursingHome] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nursingHome] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nursingHome] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nursingHome] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nursingHome] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nursingHome] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nursingHome] SET  DISABLE_BROKER 
GO
ALTER DATABASE [nursingHome] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nursingHome] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nursingHome] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nursingHome] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nursingHome] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nursingHome] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nursingHome] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nursingHome] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [nursingHome] SET  MULTI_USER 
GO
ALTER DATABASE [nursingHome] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nursingHome] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nursingHome] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nursingHome] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [nursingHome] SET DELAYED_DURABILITY = DISABLED 
GO
USE [nursingHome]
GO
/****** Object:  Table [dbo].[Elders]    Script Date: 6/7/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elders](
	[elder_id] [int] NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[first_name] [nchar](50) NULL,
	[last_name] [nchar](50) NULL,
 CONSTRAINT [PK_Elders] PRIMARY KEY CLUSTERED 
(
	[elder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurses]    Script Date: 6/7/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurses](
	[nurse_id] [int] NOT NULL,
	[first_name] [nchar](50) NOT NULL,
	[last_name] [nchar](50) NOT NULL,
	[email] [nchar](100) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[elder_id] [int] NOT NULL,
 CONSTRAINT [PK_Nurses] PRIMARY KEY CLUSTERED 
(
	[nurse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nursing_homes]    Script Date: 6/7/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nursing_homes](
	[nursing_home_id] [int] NOT NULL,
	[nursing_home_name] [nchar](100) NOT NULL,
	[location] [nchar](100) NOT NULL,
	[max_elders] [int] NOT NULL,
	[current_elders] [int] NOT NULL,
	[number_nurses] [int] NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[nurse_id] [int] NOT NULL,
	[elder_id] [int] NOT NULL,
 CONSTRAINT [PK_Nursery_homes] PRIMARY KEY CLUSTERED 
(
	[nursing_home_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/7/2022 3:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nchar](50) NOT NULL,
	[last_name] [nchar](50) NOT NULL,
	[email] [nchar](100) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[elder_id] [int] NULL,
	[password] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Elders] ([elder_id], [dateOfBirth], [first_name], [last_name]) VALUES (1, CAST(N'1955-02-03' AS Date), N'Ivan                                              ', N'Hristov                                           ')
INSERT [dbo].[Elders] ([elder_id], [dateOfBirth], [first_name], [last_name]) VALUES (2, CAST(N'1957-10-10' AS Date), N'Chavdar                                           ', N'Bojinov                                           ')
INSERT [dbo].[Elders] ([elder_id], [dateOfBirth], [first_name], [last_name]) VALUES (3, CAST(N'1960-12-13' AS Date), N'Sesiliya                                          ', N'Heronova                                          ')
INSERT [dbo].[Elders] ([elder_id], [dateOfBirth], [first_name], [last_name]) VALUES (4, CAST(N'1954-04-07' AS Date), N'Kalinka                                           ', N'Bilyanova                                         ')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (1, N'Ali                                               ', N'Raza                                              ', N'aliraza22@abv.bg                                                                                    ', N'0854838481', CAST(N'1960-01-02' AS Date), NULL, N'Ali123                                                                                              ')
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (2, N'Petya                                             ', N'Raynabalkanska                                    ', N'balkanska69@abv.bg                                                                                  ', N'0853123481', CAST(N'1967-01-16' AS Date), NULL, N'Balkanovic                                                                                          ')
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (3, N'Ognyan                                            ', N'Peevski                                           ', N'ogito55@abv.bg                                                                                      ', N'0888483812', CAST(N'1957-01-04' AS Date), NULL, N'ogitotrepacha                                                                                       ')
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (5, N'Stoqnka                                           ', N'Gospodinova                                       ', N'stoqqnka59@abv.bg                                                                                   ', N'0885043918', CAST(N'1955-01-05' AS Date), NULL, N'gospodinovastoqnka                                                                                  ')
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (6, N'Stefka                                            ', N'Spasova                                           ', N'azsumstefka@abv.bg                                                                                  ', N'0885787126', CAST(N'1960-01-10' AS Date), NULL, N'StefkaSpas12                                                                                        ')
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (7, N'Yovka                                             ', N'Mutafova                                          ', N'yovcheto58@abv.bg                                                                                   ', N'0889481268', CAST(N'1966-01-31' AS Date), NULL, N'Yovka939123                                                                                         ')
INSERT [dbo].[Users] ([user_id], [first_name], [last_name], [email], [phone], [dateOfBirth], [elder_id], [password]) VALUES (8, N'Rangel                                            ', N'Chavdarov                                         ', N'chavdarangel@abv.bg                                                                                 ', N'0884012342', CAST(N'1959-01-02' AS Date), NULL, N'obichamJenaSi                                                                                       ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Nurses]  WITH CHECK ADD  CONSTRAINT [FK_Nurses_Elders] FOREIGN KEY([elder_id])
REFERENCES [dbo].[Elders] ([elder_id])
GO
ALTER TABLE [dbo].[Nurses] CHECK CONSTRAINT [FK_Nurses_Elders]
GO
ALTER TABLE [dbo].[Nursing_homes]  WITH CHECK ADD  CONSTRAINT [FK_Nursing_homes_Elders] FOREIGN KEY([elder_id])
REFERENCES [dbo].[Elders] ([elder_id])
GO
ALTER TABLE [dbo].[Nursing_homes] CHECK CONSTRAINT [FK_Nursing_homes_Elders]
GO
ALTER TABLE [dbo].[Nursing_homes]  WITH CHECK ADD  CONSTRAINT [FK_Nursing_homes_Nurses] FOREIGN KEY([nurse_id])
REFERENCES [dbo].[Nurses] ([nurse_id])
GO
ALTER TABLE [dbo].[Nursing_homes] CHECK CONSTRAINT [FK_Nursing_homes_Nurses]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Elders] FOREIGN KEY([elder_id])
REFERENCES [dbo].[Elders] ([elder_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Elders]
GO
USE [master]
GO
ALTER DATABASE [nursingHome] SET  READ_WRITE 
GO
