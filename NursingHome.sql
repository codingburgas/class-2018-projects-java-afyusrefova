USE [master]
GO
/****** Object:  Database [nursingHome]    Script Date: 15.4.2022 г. 20:54:46 ******/
CREATE DATABASE [nursingHome]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nursingHome', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\nursingHome.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nursingHome_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\nursingHome_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [nursingHome] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [nursingHome] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [nursingHome] SET QUERY_STORE = OFF
GO
USE [nursingHome]
GO
/****** Object:  Table [dbo].[Elders]    Script Date: 15.4.2022 г. 20:54:46 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurses]    Script Date: 15.4.2022 г. 20:54:46 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nursing_homes]    Script Date: 15.4.2022 г. 20:54:46 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15.4.2022 г. 20:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[first_name] [nchar](50) NOT NULL,
	[last_name] [nchar](50) NOT NULL,
	[email] [nchar](100) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[elder_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
