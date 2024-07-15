USE [master]
GO
/****** Object:  Database [Trading2024]    Script Date: 16/07/2024 1:23:15 SA ******/
CREATE DATABASE [Trading2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trading2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trading2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trading2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trading2024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trading2024] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trading2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trading2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trading2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trading2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trading2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trading2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trading2024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trading2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trading2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trading2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trading2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trading2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trading2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trading2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trading2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trading2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trading2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trading2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trading2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trading2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trading2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trading2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trading2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trading2024] SET RECOVERY FULL 
GO
ALTER DATABASE [Trading2024] SET  MULTI_USER 
GO
ALTER DATABASE [Trading2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trading2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trading2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trading2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trading2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trading2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trading2024', N'ON'
GO
ALTER DATABASE [Trading2024] SET QUERY_STORE = OFF
GO
USE [Trading2024]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/07/2024 1:23:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/07/2024 1:23:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[describe] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[id_sequence]    Script Date: 16/07/2024 1:23:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[id_sequence](
	[seq_name] [varchar](50) NOT NULL,
	[seq_value] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seq_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageCount]    Script Date: 16/07/2024 1:23:15 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageCount](
	[ID] [int] NOT NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'diepnt', N'123')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'sonnt', N'123')
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (1, N'Nokia', N'gọn nhẹ, pin lâu')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (2, N'Samsung', N'gọn nhẹ, pin lâu')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (3, N'Iphone', N'gọn nhẹ, pin lâu')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (4, N'Oppo', N'gọn nhẹ, pin lâu')
GO
INSERT [dbo].[id_sequence] ([seq_name], [seq_value]) VALUES (N'usage_count_id', 1)
GO
INSERT [dbo].[UsageCount] ([ID], [Count]) VALUES (1, 3)
GO
USE [master]
GO
ALTER DATABASE [Trading2024] SET  READ_WRITE 
GO
