USE [master]
GO
/****** Object:  Database [OrderSaleProcess]    Script Date: 2/19/2019 11:11:22 AM ******/
CREATE DATABASE [OrderSaleProcess]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderSaleProcess', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OrderSaleProcess.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderSaleProcess_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OrderSaleProcess_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [OrderSaleProcess] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [OrderSaleProcess] SET  DISABLE_BROKER 
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
ALTER DATABASE [OrderSaleProcess] SET RECOVERY SIMPLE 
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Order]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Order](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ShippersID] [int] NULL,
	[SupplierID] [int] NULL,
	[EmployeeID] [int] NULL,
	[DateID] [int] NULL,
	[CustomerID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Quantity*UnitPrice] [decimal](9, 2) NOT NULL,
	[Discount] [decimal](9, 2) NULL,
 CONSTRAINT [PK_F_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [decimal](9, 2) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShippersID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ShippersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/19/2019 11:11:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Customer]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[Date] ([DateID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Date]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Employee]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Product]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Shipper] FOREIGN KEY([ShippersID])
REFERENCES [dbo].[Shipper] ([ShippersID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Shipper]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Supplier]
GO
USE [master]
GO
ALTER DATABASE [OrderSaleProcess] SET  READ_WRITE 
GO
