USE [master]
GO
/****** Object:  Database [OrderSaleProcess]    Script Date: 26/06/2019 14:58:46 ******/
CREATE DATABASE [OrderSaleProcess]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderSaleProcess', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OrderSaleProcess.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderSaleProcess_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OrderSaleProcess_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OrderSaleProcess] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderSaleProcess].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderSaleProcess] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OrderSaleProcess] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderSaleProcess] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderSaleProcess] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OrderSaleProcess] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderSaleProcess] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET RECOVERY FULL 
GO
ALTER DATABASE [OrderSaleProcess] SET  MULTI_USER 
GO
ALTER DATABASE [OrderSaleProcess] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderSaleProcess] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderSaleProcess] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderSaleProcess] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrderSaleProcess] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrderSaleProcess] SET QUERY_STORE = OFF
GO
USE [OrderSaleProcess]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[CalendarDate] [datetime] NULL,
	[WeekDayName] [nvarchar](50) NULL,
	[MonthName] [nvarchar](50) NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Order]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[P_ID] [int] NULL,
	[E_ID] [int] NULL,
	[DateID] [int] NULL,
	[C_ID] [int] NULL,
	[Quantity] [smallint] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[Discount] [real] NULL,
 CONSTRAINT [PK_F_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Customer]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Customer](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Employee]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Employee](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL,
 CONSTRAINT [PK_E_ID] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Product]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[validFrom] [date] NULL,
	[validTo] [date] NULL,
 CONSTRAINT [PK_P_ID] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_order]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_order](
	[C_ID] [int] NULL,
	[E_ID] [int] NULL,
	[P_ID] [int] NULL,
	[D_ID] [int] NULL,
	[CustomerID] [nchar](10) NULL,
	[ProductID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Quantity] [smallint] NULL,
	[SalesAmount] [money] NULL,
	[Discount] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Validator]    Script Date: 26/06/2019 14:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Validator](
	[CurrentValid] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Customer] FOREIGN KEY([C_ID])
REFERENCES [dbo].[Customer] ([C_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Customer]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Employee] FOREIGN KEY([E_ID])
REFERENCES [dbo].[Employee] ([E_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Employee]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_F_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[Calendar] ([DateID])
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_F_Date]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Product] FOREIGN KEY([P_ID])
REFERENCES [dbo].[Product] ([P_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Product]
GO
USE [master]
GO
ALTER DATABASE [OrderSaleProcess] SET  READ_WRITE 
GO
