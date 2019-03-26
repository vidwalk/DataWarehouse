USE [master]
GO
/****** Object:  Database [OrderSaleProcess]    Script Date: 3/26/19 11:51:01 AM ******/
CREATE DATABASE [OrderSaleProcess]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderSaleProcess', FILENAME = N'/var/opt/mssql/data/OrderSaleProcess.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderSaleProcess_log', FILENAME = N'/var/opt/mssql/data/OrderSaleProcess_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OrderSaleProcess]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 3/26/19 11:51:01 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 3/26/19 11:51:01 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 3/26/19 11:51:01 AM ******/
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
/****** Object:  Table [dbo].[F_Order]    Script Date: 3/26/19 11:51:01 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/26/19 11:51:01 AM ******/
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
/****** Object:  Table [dbo].[stage_dim_Customer]    Script Date: 3/26/19 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Customer](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[Country] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Employee]    Script Date: 3/26/19 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Employee](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_E_ID] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Product]    Script Date: 3/26/19 11:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_P_ID] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_order]    Script Date: 3/26/19 11:51:02 AM ******/
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
/****** Object:  Table [dbo].[Validator]    Script Date: 3/26/19 11:51:02 AM ******/
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
SET IDENTITY_INSERT [dbo].[Calendar] ON 

INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1, CAST(N'1996-01-01T00:00:00.000' AS DateTime), N'Monday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (2, CAST(N'1996-01-02T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (3, CAST(N'1996-01-03T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (4, CAST(N'1996-01-04T00:00:00.000' AS DateTime), N'Thursday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (5, CAST(N'1996-01-05T00:00:00.000' AS DateTime), N'Friday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (6, CAST(N'1996-01-06T00:00:00.000' AS DateTime), N'Saturday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (7, CAST(N'1996-01-07T00:00:00.000' AS DateTime), N'Sunday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (8, CAST(N'1996-01-08T00:00:00.000' AS DateTime), N'Monday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (9, CAST(N'1996-01-09T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (10, CAST(N'1996-01-10T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (11, CAST(N'1996-01-11T00:00:00.000' AS DateTime), N'Thursday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (12, CAST(N'1996-01-12T00:00:00.000' AS DateTime), N'Friday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (13, CAST(N'1996-01-13T00:00:00.000' AS DateTime), N'Saturday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (14, CAST(N'1996-01-14T00:00:00.000' AS DateTime), N'Sunday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (15, CAST(N'1996-01-15T00:00:00.000' AS DateTime), N'Monday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (16, CAST(N'1996-01-16T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (17, CAST(N'1996-01-17T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (18, CAST(N'1996-01-18T00:00:00.000' AS DateTime), N'Thursday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (19, CAST(N'1996-01-19T00:00:00.000' AS DateTime), N'Friday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (20, CAST(N'1996-01-20T00:00:00.000' AS DateTime), N'Saturday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (21, CAST(N'1996-01-21T00:00:00.000' AS DateTime), N'Sunday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (22, CAST(N'1996-01-22T00:00:00.000' AS DateTime), N'Monday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (23, CAST(N'1996-01-23T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (24, CAST(N'1996-01-24T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (25, CAST(N'1996-01-25T00:00:00.000' AS DateTime), N'Thursday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (26, CAST(N'1996-01-26T00:00:00.000' AS DateTime), N'Friday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (27, CAST(N'1996-01-27T00:00:00.000' AS DateTime), N'Saturday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (28, CAST(N'1996-01-28T00:00:00.000' AS DateTime), N'Sunday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (29, CAST(N'1996-01-29T00:00:00.000' AS DateTime), N'Monday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (30, CAST(N'1996-01-30T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (31, CAST(N'1996-01-31T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (32, CAST(N'1996-02-01T00:00:00.000' AS DateTime), N'Thursday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (33, CAST(N'1996-02-02T00:00:00.000' AS DateTime), N'Friday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (34, CAST(N'1996-02-03T00:00:00.000' AS DateTime), N'Saturday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (35, CAST(N'1996-02-04T00:00:00.000' AS DateTime), N'Sunday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (36, CAST(N'1996-02-05T00:00:00.000' AS DateTime), N'Monday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (37, CAST(N'1996-02-06T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (38, CAST(N'1996-02-07T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (39, CAST(N'1996-02-08T00:00:00.000' AS DateTime), N'Thursday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (40, CAST(N'1996-02-09T00:00:00.000' AS DateTime), N'Friday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (41, CAST(N'1996-02-10T00:00:00.000' AS DateTime), N'Saturday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (42, CAST(N'1996-02-11T00:00:00.000' AS DateTime), N'Sunday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (43, CAST(N'1996-02-12T00:00:00.000' AS DateTime), N'Monday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (44, CAST(N'1996-02-13T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (45, CAST(N'1996-02-14T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (46, CAST(N'1996-02-15T00:00:00.000' AS DateTime), N'Thursday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (47, CAST(N'1996-02-16T00:00:00.000' AS DateTime), N'Friday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (48, CAST(N'1996-02-17T00:00:00.000' AS DateTime), N'Saturday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (49, CAST(N'1996-02-18T00:00:00.000' AS DateTime), N'Sunday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (50, CAST(N'1996-02-19T00:00:00.000' AS DateTime), N'Monday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (51, CAST(N'1996-02-20T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (52, CAST(N'1996-02-21T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (53, CAST(N'1996-02-22T00:00:00.000' AS DateTime), N'Thursday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (54, CAST(N'1996-02-23T00:00:00.000' AS DateTime), N'Friday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (55, CAST(N'1996-02-24T00:00:00.000' AS DateTime), N'Saturday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (56, CAST(N'1996-02-25T00:00:00.000' AS DateTime), N'Sunday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (57, CAST(N'1996-02-26T00:00:00.000' AS DateTime), N'Monday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (58, CAST(N'1996-02-27T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (59, CAST(N'1996-02-28T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (60, CAST(N'1996-02-29T00:00:00.000' AS DateTime), N'Thursday', N'February', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (61, CAST(N'1996-03-01T00:00:00.000' AS DateTime), N'Friday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (62, CAST(N'1996-03-02T00:00:00.000' AS DateTime), N'Saturday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (63, CAST(N'1996-03-03T00:00:00.000' AS DateTime), N'Sunday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (64, CAST(N'1996-03-04T00:00:00.000' AS DateTime), N'Monday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (65, CAST(N'1996-03-05T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (66, CAST(N'1996-03-06T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (67, CAST(N'1996-03-07T00:00:00.000' AS DateTime), N'Thursday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (68, CAST(N'1996-03-08T00:00:00.000' AS DateTime), N'Friday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (69, CAST(N'1996-03-09T00:00:00.000' AS DateTime), N'Saturday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (70, CAST(N'1996-03-10T00:00:00.000' AS DateTime), N'Sunday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (71, CAST(N'1996-03-11T00:00:00.000' AS DateTime), N'Monday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (72, CAST(N'1996-03-12T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (73, CAST(N'1996-03-13T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (74, CAST(N'1996-03-14T00:00:00.000' AS DateTime), N'Thursday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (75, CAST(N'1996-03-15T00:00:00.000' AS DateTime), N'Friday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (76, CAST(N'1996-03-16T00:00:00.000' AS DateTime), N'Saturday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (77, CAST(N'1996-03-17T00:00:00.000' AS DateTime), N'Sunday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (78, CAST(N'1996-03-18T00:00:00.000' AS DateTime), N'Monday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (79, CAST(N'1996-03-19T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (80, CAST(N'1996-03-20T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (81, CAST(N'1996-03-21T00:00:00.000' AS DateTime), N'Thursday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (82, CAST(N'1996-03-22T00:00:00.000' AS DateTime), N'Friday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (83, CAST(N'1996-03-23T00:00:00.000' AS DateTime), N'Saturday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (84, CAST(N'1996-03-24T00:00:00.000' AS DateTime), N'Sunday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (85, CAST(N'1996-03-25T00:00:00.000' AS DateTime), N'Monday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (86, CAST(N'1996-03-26T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (87, CAST(N'1996-03-27T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (88, CAST(N'1996-03-28T00:00:00.000' AS DateTime), N'Thursday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (89, CAST(N'1996-03-29T00:00:00.000' AS DateTime), N'Friday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (90, CAST(N'1996-03-30T00:00:00.000' AS DateTime), N'Saturday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (91, CAST(N'1996-03-31T00:00:00.000' AS DateTime), N'Sunday', N'March', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (92, CAST(N'1996-04-01T00:00:00.000' AS DateTime), N'Monday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (93, CAST(N'1996-04-02T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (94, CAST(N'1996-04-03T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (95, CAST(N'1996-04-04T00:00:00.000' AS DateTime), N'Thursday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (96, CAST(N'1996-04-05T00:00:00.000' AS DateTime), N'Friday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (97, CAST(N'1996-04-06T00:00:00.000' AS DateTime), N'Saturday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (98, CAST(N'1996-04-07T00:00:00.000' AS DateTime), N'Sunday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (99, CAST(N'1996-04-08T00:00:00.000' AS DateTime), N'Monday', N'April', 1996)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (100, CAST(N'1996-04-09T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (101, CAST(N'1996-04-10T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (102, CAST(N'1996-04-11T00:00:00.000' AS DateTime), N'Thursday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (103, CAST(N'1996-04-12T00:00:00.000' AS DateTime), N'Friday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (104, CAST(N'1996-04-13T00:00:00.000' AS DateTime), N'Saturday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (105, CAST(N'1996-04-14T00:00:00.000' AS DateTime), N'Sunday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (106, CAST(N'1996-04-15T00:00:00.000' AS DateTime), N'Monday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (107, CAST(N'1996-04-16T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (108, CAST(N'1996-04-17T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (109, CAST(N'1996-04-18T00:00:00.000' AS DateTime), N'Thursday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (110, CAST(N'1996-04-19T00:00:00.000' AS DateTime), N'Friday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (111, CAST(N'1996-04-20T00:00:00.000' AS DateTime), N'Saturday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (112, CAST(N'1996-04-21T00:00:00.000' AS DateTime), N'Sunday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (113, CAST(N'1996-04-22T00:00:00.000' AS DateTime), N'Monday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (114, CAST(N'1996-04-23T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (115, CAST(N'1996-04-24T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (116, CAST(N'1996-04-25T00:00:00.000' AS DateTime), N'Thursday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (117, CAST(N'1996-04-26T00:00:00.000' AS DateTime), N'Friday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (118, CAST(N'1996-04-27T00:00:00.000' AS DateTime), N'Saturday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (119, CAST(N'1996-04-28T00:00:00.000' AS DateTime), N'Sunday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (120, CAST(N'1996-04-29T00:00:00.000' AS DateTime), N'Monday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (121, CAST(N'1996-04-30T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (122, CAST(N'1996-05-01T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (123, CAST(N'1996-05-02T00:00:00.000' AS DateTime), N'Thursday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (124, CAST(N'1996-05-03T00:00:00.000' AS DateTime), N'Friday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (125, CAST(N'1996-05-04T00:00:00.000' AS DateTime), N'Saturday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (126, CAST(N'1996-05-05T00:00:00.000' AS DateTime), N'Sunday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (127, CAST(N'1996-05-06T00:00:00.000' AS DateTime), N'Monday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (128, CAST(N'1996-05-07T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (129, CAST(N'1996-05-08T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (130, CAST(N'1996-05-09T00:00:00.000' AS DateTime), N'Thursday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (131, CAST(N'1996-05-10T00:00:00.000' AS DateTime), N'Friday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (132, CAST(N'1996-05-11T00:00:00.000' AS DateTime), N'Saturday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (133, CAST(N'1996-05-12T00:00:00.000' AS DateTime), N'Sunday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (134, CAST(N'1996-05-13T00:00:00.000' AS DateTime), N'Monday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (135, CAST(N'1996-05-14T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (136, CAST(N'1996-05-15T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (137, CAST(N'1996-05-16T00:00:00.000' AS DateTime), N'Thursday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (138, CAST(N'1996-05-17T00:00:00.000' AS DateTime), N'Friday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (139, CAST(N'1996-05-18T00:00:00.000' AS DateTime), N'Saturday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (140, CAST(N'1996-05-19T00:00:00.000' AS DateTime), N'Sunday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (141, CAST(N'1996-05-20T00:00:00.000' AS DateTime), N'Monday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (142, CAST(N'1996-05-21T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (143, CAST(N'1996-05-22T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (144, CAST(N'1996-05-23T00:00:00.000' AS DateTime), N'Thursday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (145, CAST(N'1996-05-24T00:00:00.000' AS DateTime), N'Friday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (146, CAST(N'1996-05-25T00:00:00.000' AS DateTime), N'Saturday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (147, CAST(N'1996-05-26T00:00:00.000' AS DateTime), N'Sunday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (148, CAST(N'1996-05-27T00:00:00.000' AS DateTime), N'Monday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (149, CAST(N'1996-05-28T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (150, CAST(N'1996-05-29T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (151, CAST(N'1996-05-30T00:00:00.000' AS DateTime), N'Thursday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (152, CAST(N'1996-05-31T00:00:00.000' AS DateTime), N'Friday', N'May', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (153, CAST(N'1996-06-01T00:00:00.000' AS DateTime), N'Saturday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (154, CAST(N'1996-06-02T00:00:00.000' AS DateTime), N'Sunday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (155, CAST(N'1996-06-03T00:00:00.000' AS DateTime), N'Monday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (156, CAST(N'1996-06-04T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (157, CAST(N'1996-06-05T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (158, CAST(N'1996-06-06T00:00:00.000' AS DateTime), N'Thursday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (159, CAST(N'1996-06-07T00:00:00.000' AS DateTime), N'Friday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (160, CAST(N'1996-06-08T00:00:00.000' AS DateTime), N'Saturday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (161, CAST(N'1996-06-09T00:00:00.000' AS DateTime), N'Sunday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (162, CAST(N'1996-06-10T00:00:00.000' AS DateTime), N'Monday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (163, CAST(N'1996-06-11T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (164, CAST(N'1996-06-12T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (165, CAST(N'1996-06-13T00:00:00.000' AS DateTime), N'Thursday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (166, CAST(N'1996-06-14T00:00:00.000' AS DateTime), N'Friday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (167, CAST(N'1996-06-15T00:00:00.000' AS DateTime), N'Saturday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (168, CAST(N'1996-06-16T00:00:00.000' AS DateTime), N'Sunday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (169, CAST(N'1996-06-17T00:00:00.000' AS DateTime), N'Monday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (170, CAST(N'1996-06-18T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (171, CAST(N'1996-06-19T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (172, CAST(N'1996-06-20T00:00:00.000' AS DateTime), N'Thursday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (173, CAST(N'1996-06-21T00:00:00.000' AS DateTime), N'Friday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (174, CAST(N'1996-06-22T00:00:00.000' AS DateTime), N'Saturday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (175, CAST(N'1996-06-23T00:00:00.000' AS DateTime), N'Sunday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (176, CAST(N'1996-06-24T00:00:00.000' AS DateTime), N'Monday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (177, CAST(N'1996-06-25T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (178, CAST(N'1996-06-26T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (179, CAST(N'1996-06-27T00:00:00.000' AS DateTime), N'Thursday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (180, CAST(N'1996-06-28T00:00:00.000' AS DateTime), N'Friday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (181, CAST(N'1996-06-29T00:00:00.000' AS DateTime), N'Saturday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (182, CAST(N'1996-06-30T00:00:00.000' AS DateTime), N'Sunday', N'June', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (183, CAST(N'1996-07-01T00:00:00.000' AS DateTime), N'Monday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (184, CAST(N'1996-07-02T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (185, CAST(N'1996-07-03T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (186, CAST(N'1996-07-04T00:00:00.000' AS DateTime), N'Thursday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (187, CAST(N'1996-07-05T00:00:00.000' AS DateTime), N'Friday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (188, CAST(N'1996-07-06T00:00:00.000' AS DateTime), N'Saturday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (189, CAST(N'1996-07-07T00:00:00.000' AS DateTime), N'Sunday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (190, CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'Monday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (191, CAST(N'1996-07-09T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (192, CAST(N'1996-07-10T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (193, CAST(N'1996-07-11T00:00:00.000' AS DateTime), N'Thursday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (194, CAST(N'1996-07-12T00:00:00.000' AS DateTime), N'Friday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (195, CAST(N'1996-07-13T00:00:00.000' AS DateTime), N'Saturday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (196, CAST(N'1996-07-14T00:00:00.000' AS DateTime), N'Sunday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (197, CAST(N'1996-07-15T00:00:00.000' AS DateTime), N'Monday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (198, CAST(N'1996-07-16T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (199, CAST(N'1996-07-17T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1996)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (200, CAST(N'1996-07-18T00:00:00.000' AS DateTime), N'Thursday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (201, CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Friday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (202, CAST(N'1996-07-20T00:00:00.000' AS DateTime), N'Saturday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (203, CAST(N'1996-07-21T00:00:00.000' AS DateTime), N'Sunday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (204, CAST(N'1996-07-22T00:00:00.000' AS DateTime), N'Monday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (205, CAST(N'1996-07-23T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (206, CAST(N'1996-07-24T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (207, CAST(N'1996-07-25T00:00:00.000' AS DateTime), N'Thursday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (208, CAST(N'1996-07-26T00:00:00.000' AS DateTime), N'Friday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (209, CAST(N'1996-07-27T00:00:00.000' AS DateTime), N'Saturday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (210, CAST(N'1996-07-28T00:00:00.000' AS DateTime), N'Sunday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (211, CAST(N'1996-07-29T00:00:00.000' AS DateTime), N'Monday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (212, CAST(N'1996-07-30T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (213, CAST(N'1996-07-31T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (214, CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'Thursday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (215, CAST(N'1996-08-02T00:00:00.000' AS DateTime), N'Friday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (216, CAST(N'1996-08-03T00:00:00.000' AS DateTime), N'Saturday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (217, CAST(N'1996-08-04T00:00:00.000' AS DateTime), N'Sunday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (218, CAST(N'1996-08-05T00:00:00.000' AS DateTime), N'Monday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (219, CAST(N'1996-08-06T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (220, CAST(N'1996-08-07T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (221, CAST(N'1996-08-08T00:00:00.000' AS DateTime), N'Thursday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (222, CAST(N'1996-08-09T00:00:00.000' AS DateTime), N'Friday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (223, CAST(N'1996-08-10T00:00:00.000' AS DateTime), N'Saturday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (224, CAST(N'1996-08-11T00:00:00.000' AS DateTime), N'Sunday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (225, CAST(N'1996-08-12T00:00:00.000' AS DateTime), N'Monday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (226, CAST(N'1996-08-13T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (227, CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (228, CAST(N'1996-08-15T00:00:00.000' AS DateTime), N'Thursday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (229, CAST(N'1996-08-16T00:00:00.000' AS DateTime), N'Friday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (230, CAST(N'1996-08-17T00:00:00.000' AS DateTime), N'Saturday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (231, CAST(N'1996-08-18T00:00:00.000' AS DateTime), N'Sunday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (232, CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Monday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (233, CAST(N'1996-08-20T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (234, CAST(N'1996-08-21T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (235, CAST(N'1996-08-22T00:00:00.000' AS DateTime), N'Thursday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (236, CAST(N'1996-08-23T00:00:00.000' AS DateTime), N'Friday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (237, CAST(N'1996-08-24T00:00:00.000' AS DateTime), N'Saturday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (238, CAST(N'1996-08-25T00:00:00.000' AS DateTime), N'Sunday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (239, CAST(N'1996-08-26T00:00:00.000' AS DateTime), N'Monday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (240, CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (241, CAST(N'1996-08-28T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (242, CAST(N'1996-08-29T00:00:00.000' AS DateTime), N'Thursday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (243, CAST(N'1996-08-30T00:00:00.000' AS DateTime), N'Friday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (244, CAST(N'1996-08-31T00:00:00.000' AS DateTime), N'Saturday', N'August', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (245, CAST(N'1996-09-01T00:00:00.000' AS DateTime), N'Sunday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (246, CAST(N'1996-09-02T00:00:00.000' AS DateTime), N'Monday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (247, CAST(N'1996-09-03T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (248, CAST(N'1996-09-04T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (249, CAST(N'1996-09-05T00:00:00.000' AS DateTime), N'Thursday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (250, CAST(N'1996-09-06T00:00:00.000' AS DateTime), N'Friday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (251, CAST(N'1996-09-07T00:00:00.000' AS DateTime), N'Saturday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (252, CAST(N'1996-09-08T00:00:00.000' AS DateTime), N'Sunday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (253, CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Monday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (254, CAST(N'1996-09-10T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (255, CAST(N'1996-09-11T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (256, CAST(N'1996-09-12T00:00:00.000' AS DateTime), N'Thursday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (257, CAST(N'1996-09-13T00:00:00.000' AS DateTime), N'Friday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (258, CAST(N'1996-09-14T00:00:00.000' AS DateTime), N'Saturday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (259, CAST(N'1996-09-15T00:00:00.000' AS DateTime), N'Sunday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (260, CAST(N'1996-09-16T00:00:00.000' AS DateTime), N'Monday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (261, CAST(N'1996-09-17T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (262, CAST(N'1996-09-18T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (263, CAST(N'1996-09-19T00:00:00.000' AS DateTime), N'Thursday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (264, CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'Friday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (265, CAST(N'1996-09-21T00:00:00.000' AS DateTime), N'Saturday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (266, CAST(N'1996-09-22T00:00:00.000' AS DateTime), N'Sunday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (267, CAST(N'1996-09-23T00:00:00.000' AS DateTime), N'Monday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (268, CAST(N'1996-09-24T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (269, CAST(N'1996-09-25T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (270, CAST(N'1996-09-26T00:00:00.000' AS DateTime), N'Thursday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (271, CAST(N'1996-09-27T00:00:00.000' AS DateTime), N'Friday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (272, CAST(N'1996-09-28T00:00:00.000' AS DateTime), N'Saturday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (273, CAST(N'1996-09-29T00:00:00.000' AS DateTime), N'Sunday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (274, CAST(N'1996-09-30T00:00:00.000' AS DateTime), N'Monday', N'September', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (275, CAST(N'1996-10-01T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (276, CAST(N'1996-10-02T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (277, CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Thursday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (278, CAST(N'1996-10-04T00:00:00.000' AS DateTime), N'Friday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (279, CAST(N'1996-10-05T00:00:00.000' AS DateTime), N'Saturday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (280, CAST(N'1996-10-06T00:00:00.000' AS DateTime), N'Sunday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (281, CAST(N'1996-10-07T00:00:00.000' AS DateTime), N'Monday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (282, CAST(N'1996-10-08T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (283, CAST(N'1996-10-09T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (284, CAST(N'1996-10-10T00:00:00.000' AS DateTime), N'Thursday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (285, CAST(N'1996-10-11T00:00:00.000' AS DateTime), N'Friday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (286, CAST(N'1996-10-12T00:00:00.000' AS DateTime), N'Saturday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (287, CAST(N'1996-10-13T00:00:00.000' AS DateTime), N'Sunday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (288, CAST(N'1996-10-14T00:00:00.000' AS DateTime), N'Monday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (289, CAST(N'1996-10-15T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (290, CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (291, CAST(N'1996-10-17T00:00:00.000' AS DateTime), N'Thursday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (292, CAST(N'1996-10-18T00:00:00.000' AS DateTime), N'Friday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (293, CAST(N'1996-10-19T00:00:00.000' AS DateTime), N'Saturday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (294, CAST(N'1996-10-20T00:00:00.000' AS DateTime), N'Sunday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (295, CAST(N'1996-10-21T00:00:00.000' AS DateTime), N'Monday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (296, CAST(N'1996-10-22T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (297, CAST(N'1996-10-23T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (298, CAST(N'1996-10-24T00:00:00.000' AS DateTime), N'Thursday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (299, CAST(N'1996-10-25T00:00:00.000' AS DateTime), N'Friday', N'October', 1996)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (300, CAST(N'1996-10-26T00:00:00.000' AS DateTime), N'Saturday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (301, CAST(N'1996-10-27T00:00:00.000' AS DateTime), N'Sunday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (302, CAST(N'1996-10-28T00:00:00.000' AS DateTime), N'Monday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (303, CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (304, CAST(N'1996-10-30T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (305, CAST(N'1996-10-31T00:00:00.000' AS DateTime), N'Thursday', N'October', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (306, CAST(N'1996-11-01T00:00:00.000' AS DateTime), N'Friday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (307, CAST(N'1996-11-02T00:00:00.000' AS DateTime), N'Saturday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (308, CAST(N'1996-11-03T00:00:00.000' AS DateTime), N'Sunday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (309, CAST(N'1996-11-04T00:00:00.000' AS DateTime), N'Monday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (310, CAST(N'1996-11-05T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (311, CAST(N'1996-11-06T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (312, CAST(N'1996-11-07T00:00:00.000' AS DateTime), N'Thursday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (313, CAST(N'1996-11-08T00:00:00.000' AS DateTime), N'Friday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (314, CAST(N'1996-11-09T00:00:00.000' AS DateTime), N'Saturday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (315, CAST(N'1996-11-10T00:00:00.000' AS DateTime), N'Sunday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (316, CAST(N'1996-11-11T00:00:00.000' AS DateTime), N'Monday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (317, CAST(N'1996-11-12T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (318, CAST(N'1996-11-13T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (319, CAST(N'1996-11-14T00:00:00.000' AS DateTime), N'Thursday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (320, CAST(N'1996-11-15T00:00:00.000' AS DateTime), N'Friday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (321, CAST(N'1996-11-16T00:00:00.000' AS DateTime), N'Saturday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (322, CAST(N'1996-11-17T00:00:00.000' AS DateTime), N'Sunday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (323, CAST(N'1996-11-18T00:00:00.000' AS DateTime), N'Monday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (324, CAST(N'1996-11-19T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (325, CAST(N'1996-11-20T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (326, CAST(N'1996-11-21T00:00:00.000' AS DateTime), N'Thursday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (327, CAST(N'1996-11-22T00:00:00.000' AS DateTime), N'Friday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (328, CAST(N'1996-11-23T00:00:00.000' AS DateTime), N'Saturday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (329, CAST(N'1996-11-24T00:00:00.000' AS DateTime), N'Sunday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (330, CAST(N'1996-11-25T00:00:00.000' AS DateTime), N'Monday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (331, CAST(N'1996-11-26T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (332, CAST(N'1996-11-27T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (333, CAST(N'1996-11-28T00:00:00.000' AS DateTime), N'Thursday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (334, CAST(N'1996-11-29T00:00:00.000' AS DateTime), N'Friday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (335, CAST(N'1996-11-30T00:00:00.000' AS DateTime), N'Saturday', N'November', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (336, CAST(N'1996-12-01T00:00:00.000' AS DateTime), N'Sunday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (337, CAST(N'1996-12-02T00:00:00.000' AS DateTime), N'Monday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (338, CAST(N'1996-12-03T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (339, CAST(N'1996-12-04T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (340, CAST(N'1996-12-05T00:00:00.000' AS DateTime), N'Thursday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (341, CAST(N'1996-12-06T00:00:00.000' AS DateTime), N'Friday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (342, CAST(N'1996-12-07T00:00:00.000' AS DateTime), N'Saturday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (343, CAST(N'1996-12-08T00:00:00.000' AS DateTime), N'Sunday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (344, CAST(N'1996-12-09T00:00:00.000' AS DateTime), N'Monday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (345, CAST(N'1996-12-10T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (346, CAST(N'1996-12-11T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (347, CAST(N'1996-12-12T00:00:00.000' AS DateTime), N'Thursday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (348, CAST(N'1996-12-13T00:00:00.000' AS DateTime), N'Friday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (349, CAST(N'1996-12-14T00:00:00.000' AS DateTime), N'Saturday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (350, CAST(N'1996-12-15T00:00:00.000' AS DateTime), N'Sunday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (351, CAST(N'1996-12-16T00:00:00.000' AS DateTime), N'Monday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (352, CAST(N'1996-12-17T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (353, CAST(N'1996-12-18T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (354, CAST(N'1996-12-19T00:00:00.000' AS DateTime), N'Thursday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (355, CAST(N'1996-12-20T00:00:00.000' AS DateTime), N'Friday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (356, CAST(N'1996-12-21T00:00:00.000' AS DateTime), N'Saturday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (357, CAST(N'1996-12-22T00:00:00.000' AS DateTime), N'Sunday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (358, CAST(N'1996-12-23T00:00:00.000' AS DateTime), N'Monday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (359, CAST(N'1996-12-24T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (360, CAST(N'1996-12-25T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (361, CAST(N'1996-12-26T00:00:00.000' AS DateTime), N'Thursday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (362, CAST(N'1996-12-27T00:00:00.000' AS DateTime), N'Friday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (363, CAST(N'1996-12-28T00:00:00.000' AS DateTime), N'Saturday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (364, CAST(N'1996-12-29T00:00:00.000' AS DateTime), N'Sunday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (365, CAST(N'1996-12-30T00:00:00.000' AS DateTime), N'Monday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (366, CAST(N'1996-12-31T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1996)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (367, CAST(N'1997-01-01T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (368, CAST(N'1997-01-02T00:00:00.000' AS DateTime), N'Thursday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (369, CAST(N'1997-01-03T00:00:00.000' AS DateTime), N'Friday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (370, CAST(N'1997-01-04T00:00:00.000' AS DateTime), N'Saturday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (371, CAST(N'1997-01-05T00:00:00.000' AS DateTime), N'Sunday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (372, CAST(N'1997-01-06T00:00:00.000' AS DateTime), N'Monday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (373, CAST(N'1997-01-07T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (374, CAST(N'1997-01-08T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (375, CAST(N'1997-01-09T00:00:00.000' AS DateTime), N'Thursday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (376, CAST(N'1997-01-10T00:00:00.000' AS DateTime), N'Friday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (377, CAST(N'1997-01-11T00:00:00.000' AS DateTime), N'Saturday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (378, CAST(N'1997-01-12T00:00:00.000' AS DateTime), N'Sunday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (379, CAST(N'1997-01-13T00:00:00.000' AS DateTime), N'Monday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (380, CAST(N'1997-01-14T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (381, CAST(N'1997-01-15T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (382, CAST(N'1997-01-16T00:00:00.000' AS DateTime), N'Thursday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (383, CAST(N'1997-01-17T00:00:00.000' AS DateTime), N'Friday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (384, CAST(N'1997-01-18T00:00:00.000' AS DateTime), N'Saturday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (385, CAST(N'1997-01-19T00:00:00.000' AS DateTime), N'Sunday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (386, CAST(N'1997-01-20T00:00:00.000' AS DateTime), N'Monday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (387, CAST(N'1997-01-21T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (388, CAST(N'1997-01-22T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (389, CAST(N'1997-01-23T00:00:00.000' AS DateTime), N'Thursday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (390, CAST(N'1997-01-24T00:00:00.000' AS DateTime), N'Friday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (391, CAST(N'1997-01-25T00:00:00.000' AS DateTime), N'Saturday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (392, CAST(N'1997-01-26T00:00:00.000' AS DateTime), N'Sunday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (393, CAST(N'1997-01-27T00:00:00.000' AS DateTime), N'Monday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (394, CAST(N'1997-01-28T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (395, CAST(N'1997-01-29T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (396, CAST(N'1997-01-30T00:00:00.000' AS DateTime), N'Thursday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (397, CAST(N'1997-01-31T00:00:00.000' AS DateTime), N'Friday', N'January', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (398, CAST(N'1997-02-01T00:00:00.000' AS DateTime), N'Saturday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (399, CAST(N'1997-02-02T00:00:00.000' AS DateTime), N'Sunday', N'February', 1997)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (400, CAST(N'1997-02-03T00:00:00.000' AS DateTime), N'Monday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (401, CAST(N'1997-02-04T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (402, CAST(N'1997-02-05T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (403, CAST(N'1997-02-06T00:00:00.000' AS DateTime), N'Thursday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (404, CAST(N'1997-02-07T00:00:00.000' AS DateTime), N'Friday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (405, CAST(N'1997-02-08T00:00:00.000' AS DateTime), N'Saturday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (406, CAST(N'1997-02-09T00:00:00.000' AS DateTime), N'Sunday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (407, CAST(N'1997-02-10T00:00:00.000' AS DateTime), N'Monday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (408, CAST(N'1997-02-11T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (409, CAST(N'1997-02-12T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (410, CAST(N'1997-02-13T00:00:00.000' AS DateTime), N'Thursday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (411, CAST(N'1997-02-14T00:00:00.000' AS DateTime), N'Friday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (412, CAST(N'1997-02-15T00:00:00.000' AS DateTime), N'Saturday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (413, CAST(N'1997-02-16T00:00:00.000' AS DateTime), N'Sunday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (414, CAST(N'1997-02-17T00:00:00.000' AS DateTime), N'Monday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (415, CAST(N'1997-02-18T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (416, CAST(N'1997-02-19T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (417, CAST(N'1997-02-20T00:00:00.000' AS DateTime), N'Thursday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (418, CAST(N'1997-02-21T00:00:00.000' AS DateTime), N'Friday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (419, CAST(N'1997-02-22T00:00:00.000' AS DateTime), N'Saturday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (420, CAST(N'1997-02-23T00:00:00.000' AS DateTime), N'Sunday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (421, CAST(N'1997-02-24T00:00:00.000' AS DateTime), N'Monday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (422, CAST(N'1997-02-25T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (423, CAST(N'1997-02-26T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (424, CAST(N'1997-02-27T00:00:00.000' AS DateTime), N'Thursday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (425, CAST(N'1997-02-28T00:00:00.000' AS DateTime), N'Friday', N'February', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (426, CAST(N'1997-03-01T00:00:00.000' AS DateTime), N'Saturday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (427, CAST(N'1997-03-02T00:00:00.000' AS DateTime), N'Sunday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (428, CAST(N'1997-03-03T00:00:00.000' AS DateTime), N'Monday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (429, CAST(N'1997-03-04T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (430, CAST(N'1997-03-05T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (431, CAST(N'1997-03-06T00:00:00.000' AS DateTime), N'Thursday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (432, CAST(N'1997-03-07T00:00:00.000' AS DateTime), N'Friday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (433, CAST(N'1997-03-08T00:00:00.000' AS DateTime), N'Saturday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (434, CAST(N'1997-03-09T00:00:00.000' AS DateTime), N'Sunday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (435, CAST(N'1997-03-10T00:00:00.000' AS DateTime), N'Monday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (436, CAST(N'1997-03-11T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (437, CAST(N'1997-03-12T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (438, CAST(N'1997-03-13T00:00:00.000' AS DateTime), N'Thursday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (439, CAST(N'1997-03-14T00:00:00.000' AS DateTime), N'Friday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (440, CAST(N'1997-03-15T00:00:00.000' AS DateTime), N'Saturday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (441, CAST(N'1997-03-16T00:00:00.000' AS DateTime), N'Sunday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (442, CAST(N'1997-03-17T00:00:00.000' AS DateTime), N'Monday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (443, CAST(N'1997-03-18T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (444, CAST(N'1997-03-19T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (445, CAST(N'1997-03-20T00:00:00.000' AS DateTime), N'Thursday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (446, CAST(N'1997-03-21T00:00:00.000' AS DateTime), N'Friday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (447, CAST(N'1997-03-22T00:00:00.000' AS DateTime), N'Saturday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (448, CAST(N'1997-03-23T00:00:00.000' AS DateTime), N'Sunday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (449, CAST(N'1997-03-24T00:00:00.000' AS DateTime), N'Monday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (450, CAST(N'1997-03-25T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (451, CAST(N'1997-03-26T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (452, CAST(N'1997-03-27T00:00:00.000' AS DateTime), N'Thursday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (453, CAST(N'1997-03-28T00:00:00.000' AS DateTime), N'Friday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (454, CAST(N'1997-03-29T00:00:00.000' AS DateTime), N'Saturday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (455, CAST(N'1997-03-30T00:00:00.000' AS DateTime), N'Sunday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (456, CAST(N'1997-03-31T00:00:00.000' AS DateTime), N'Monday', N'March', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (457, CAST(N'1997-04-01T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (458, CAST(N'1997-04-02T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (459, CAST(N'1997-04-03T00:00:00.000' AS DateTime), N'Thursday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (460, CAST(N'1997-04-04T00:00:00.000' AS DateTime), N'Friday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (461, CAST(N'1997-04-05T00:00:00.000' AS DateTime), N'Saturday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (462, CAST(N'1997-04-06T00:00:00.000' AS DateTime), N'Sunday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (463, CAST(N'1997-04-07T00:00:00.000' AS DateTime), N'Monday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (464, CAST(N'1997-04-08T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (465, CAST(N'1997-04-09T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (466, CAST(N'1997-04-10T00:00:00.000' AS DateTime), N'Thursday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (467, CAST(N'1997-04-11T00:00:00.000' AS DateTime), N'Friday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (468, CAST(N'1997-04-12T00:00:00.000' AS DateTime), N'Saturday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (469, CAST(N'1997-04-13T00:00:00.000' AS DateTime), N'Sunday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (470, CAST(N'1997-04-14T00:00:00.000' AS DateTime), N'Monday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (471, CAST(N'1997-04-15T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (472, CAST(N'1997-04-16T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (473, CAST(N'1997-04-17T00:00:00.000' AS DateTime), N'Thursday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (474, CAST(N'1997-04-18T00:00:00.000' AS DateTime), N'Friday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (475, CAST(N'1997-04-19T00:00:00.000' AS DateTime), N'Saturday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (476, CAST(N'1997-04-20T00:00:00.000' AS DateTime), N'Sunday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (477, CAST(N'1997-04-21T00:00:00.000' AS DateTime), N'Monday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (478, CAST(N'1997-04-22T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (479, CAST(N'1997-04-23T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (480, CAST(N'1997-04-24T00:00:00.000' AS DateTime), N'Thursday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (481, CAST(N'1997-04-25T00:00:00.000' AS DateTime), N'Friday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (482, CAST(N'1997-04-26T00:00:00.000' AS DateTime), N'Saturday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (483, CAST(N'1997-04-27T00:00:00.000' AS DateTime), N'Sunday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (484, CAST(N'1997-04-28T00:00:00.000' AS DateTime), N'Monday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (485, CAST(N'1997-04-29T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (486, CAST(N'1997-04-30T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (487, CAST(N'1997-05-01T00:00:00.000' AS DateTime), N'Thursday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (488, CAST(N'1997-05-02T00:00:00.000' AS DateTime), N'Friday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (489, CAST(N'1997-05-03T00:00:00.000' AS DateTime), N'Saturday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (490, CAST(N'1997-05-04T00:00:00.000' AS DateTime), N'Sunday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (491, CAST(N'1997-05-05T00:00:00.000' AS DateTime), N'Monday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (492, CAST(N'1997-05-06T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (493, CAST(N'1997-05-07T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (494, CAST(N'1997-05-08T00:00:00.000' AS DateTime), N'Thursday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (495, CAST(N'1997-05-09T00:00:00.000' AS DateTime), N'Friday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (496, CAST(N'1997-05-10T00:00:00.000' AS DateTime), N'Saturday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (497, CAST(N'1997-05-11T00:00:00.000' AS DateTime), N'Sunday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (498, CAST(N'1997-05-12T00:00:00.000' AS DateTime), N'Monday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (499, CAST(N'1997-05-13T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1997)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (500, CAST(N'1997-05-14T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (501, CAST(N'1997-05-15T00:00:00.000' AS DateTime), N'Thursday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (502, CAST(N'1997-05-16T00:00:00.000' AS DateTime), N'Friday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (503, CAST(N'1997-05-17T00:00:00.000' AS DateTime), N'Saturday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (504, CAST(N'1997-05-18T00:00:00.000' AS DateTime), N'Sunday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (505, CAST(N'1997-05-19T00:00:00.000' AS DateTime), N'Monday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (506, CAST(N'1997-05-20T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (507, CAST(N'1997-05-21T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (508, CAST(N'1997-05-22T00:00:00.000' AS DateTime), N'Thursday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (509, CAST(N'1997-05-23T00:00:00.000' AS DateTime), N'Friday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (510, CAST(N'1997-05-24T00:00:00.000' AS DateTime), N'Saturday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (511, CAST(N'1997-05-25T00:00:00.000' AS DateTime), N'Sunday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (512, CAST(N'1997-05-26T00:00:00.000' AS DateTime), N'Monday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (513, CAST(N'1997-05-27T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (514, CAST(N'1997-05-28T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (515, CAST(N'1997-05-29T00:00:00.000' AS DateTime), N'Thursday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (516, CAST(N'1997-05-30T00:00:00.000' AS DateTime), N'Friday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (517, CAST(N'1997-05-31T00:00:00.000' AS DateTime), N'Saturday', N'May', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (518, CAST(N'1997-06-01T00:00:00.000' AS DateTime), N'Sunday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (519, CAST(N'1997-06-02T00:00:00.000' AS DateTime), N'Monday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (520, CAST(N'1997-06-03T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (521, CAST(N'1997-06-04T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (522, CAST(N'1997-06-05T00:00:00.000' AS DateTime), N'Thursday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (523, CAST(N'1997-06-06T00:00:00.000' AS DateTime), N'Friday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (524, CAST(N'1997-06-07T00:00:00.000' AS DateTime), N'Saturday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (525, CAST(N'1997-06-08T00:00:00.000' AS DateTime), N'Sunday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (526, CAST(N'1997-06-09T00:00:00.000' AS DateTime), N'Monday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (527, CAST(N'1997-06-10T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (528, CAST(N'1997-06-11T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (529, CAST(N'1997-06-12T00:00:00.000' AS DateTime), N'Thursday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (530, CAST(N'1997-06-13T00:00:00.000' AS DateTime), N'Friday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (531, CAST(N'1997-06-14T00:00:00.000' AS DateTime), N'Saturday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (532, CAST(N'1997-06-15T00:00:00.000' AS DateTime), N'Sunday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (533, CAST(N'1997-06-16T00:00:00.000' AS DateTime), N'Monday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (534, CAST(N'1997-06-17T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (535, CAST(N'1997-06-18T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (536, CAST(N'1997-06-19T00:00:00.000' AS DateTime), N'Thursday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (537, CAST(N'1997-06-20T00:00:00.000' AS DateTime), N'Friday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (538, CAST(N'1997-06-21T00:00:00.000' AS DateTime), N'Saturday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (539, CAST(N'1997-06-22T00:00:00.000' AS DateTime), N'Sunday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (540, CAST(N'1997-06-23T00:00:00.000' AS DateTime), N'Monday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (541, CAST(N'1997-06-24T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (542, CAST(N'1997-06-25T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (543, CAST(N'1997-06-26T00:00:00.000' AS DateTime), N'Thursday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (544, CAST(N'1997-06-27T00:00:00.000' AS DateTime), N'Friday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (545, CAST(N'1997-06-28T00:00:00.000' AS DateTime), N'Saturday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (546, CAST(N'1997-06-29T00:00:00.000' AS DateTime), N'Sunday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (547, CAST(N'1997-06-30T00:00:00.000' AS DateTime), N'Monday', N'June', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (548, CAST(N'1997-07-01T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (549, CAST(N'1997-07-02T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (550, CAST(N'1997-07-03T00:00:00.000' AS DateTime), N'Thursday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (551, CAST(N'1997-07-04T00:00:00.000' AS DateTime), N'Friday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (552, CAST(N'1997-07-05T00:00:00.000' AS DateTime), N'Saturday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (553, CAST(N'1997-07-06T00:00:00.000' AS DateTime), N'Sunday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (554, CAST(N'1997-07-07T00:00:00.000' AS DateTime), N'Monday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (555, CAST(N'1997-07-08T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (556, CAST(N'1997-07-09T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (557, CAST(N'1997-07-10T00:00:00.000' AS DateTime), N'Thursday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (558, CAST(N'1997-07-11T00:00:00.000' AS DateTime), N'Friday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (559, CAST(N'1997-07-12T00:00:00.000' AS DateTime), N'Saturday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (560, CAST(N'1997-07-13T00:00:00.000' AS DateTime), N'Sunday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (561, CAST(N'1997-07-14T00:00:00.000' AS DateTime), N'Monday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (562, CAST(N'1997-07-15T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (563, CAST(N'1997-07-16T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (564, CAST(N'1997-07-17T00:00:00.000' AS DateTime), N'Thursday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (565, CAST(N'1997-07-18T00:00:00.000' AS DateTime), N'Friday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (566, CAST(N'1997-07-19T00:00:00.000' AS DateTime), N'Saturday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (567, CAST(N'1997-07-20T00:00:00.000' AS DateTime), N'Sunday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (568, CAST(N'1997-07-21T00:00:00.000' AS DateTime), N'Monday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (569, CAST(N'1997-07-22T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (570, CAST(N'1997-07-23T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (571, CAST(N'1997-07-24T00:00:00.000' AS DateTime), N'Thursday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (572, CAST(N'1997-07-25T00:00:00.000' AS DateTime), N'Friday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (573, CAST(N'1997-07-26T00:00:00.000' AS DateTime), N'Saturday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (574, CAST(N'1997-07-27T00:00:00.000' AS DateTime), N'Sunday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (575, CAST(N'1997-07-28T00:00:00.000' AS DateTime), N'Monday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (576, CAST(N'1997-07-29T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (577, CAST(N'1997-07-30T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (578, CAST(N'1997-07-31T00:00:00.000' AS DateTime), N'Thursday', N'July', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (579, CAST(N'1997-08-01T00:00:00.000' AS DateTime), N'Friday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (580, CAST(N'1997-08-02T00:00:00.000' AS DateTime), N'Saturday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (581, CAST(N'1997-08-03T00:00:00.000' AS DateTime), N'Sunday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (582, CAST(N'1997-08-04T00:00:00.000' AS DateTime), N'Monday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (583, CAST(N'1997-08-05T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (584, CAST(N'1997-08-06T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (585, CAST(N'1997-08-07T00:00:00.000' AS DateTime), N'Thursday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (586, CAST(N'1997-08-08T00:00:00.000' AS DateTime), N'Friday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (587, CAST(N'1997-08-09T00:00:00.000' AS DateTime), N'Saturday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (588, CAST(N'1997-08-10T00:00:00.000' AS DateTime), N'Sunday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (589, CAST(N'1997-08-11T00:00:00.000' AS DateTime), N'Monday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (590, CAST(N'1997-08-12T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (591, CAST(N'1997-08-13T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (592, CAST(N'1997-08-14T00:00:00.000' AS DateTime), N'Thursday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (593, CAST(N'1997-08-15T00:00:00.000' AS DateTime), N'Friday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (594, CAST(N'1997-08-16T00:00:00.000' AS DateTime), N'Saturday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (595, CAST(N'1997-08-17T00:00:00.000' AS DateTime), N'Sunday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (596, CAST(N'1997-08-18T00:00:00.000' AS DateTime), N'Monday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (597, CAST(N'1997-08-19T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (598, CAST(N'1997-08-20T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (599, CAST(N'1997-08-21T00:00:00.000' AS DateTime), N'Thursday', N'August', 1997)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (600, CAST(N'1997-08-22T00:00:00.000' AS DateTime), N'Friday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (601, CAST(N'1997-08-23T00:00:00.000' AS DateTime), N'Saturday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (602, CAST(N'1997-08-24T00:00:00.000' AS DateTime), N'Sunday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (603, CAST(N'1997-08-25T00:00:00.000' AS DateTime), N'Monday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (604, CAST(N'1997-08-26T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (605, CAST(N'1997-08-27T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (606, CAST(N'1997-08-28T00:00:00.000' AS DateTime), N'Thursday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (607, CAST(N'1997-08-29T00:00:00.000' AS DateTime), N'Friday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (608, CAST(N'1997-08-30T00:00:00.000' AS DateTime), N'Saturday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (609, CAST(N'1997-08-31T00:00:00.000' AS DateTime), N'Sunday', N'August', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (610, CAST(N'1997-09-01T00:00:00.000' AS DateTime), N'Monday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (611, CAST(N'1997-09-02T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (612, CAST(N'1997-09-03T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (613, CAST(N'1997-09-04T00:00:00.000' AS DateTime), N'Thursday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (614, CAST(N'1997-09-05T00:00:00.000' AS DateTime), N'Friday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (615, CAST(N'1997-09-06T00:00:00.000' AS DateTime), N'Saturday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (616, CAST(N'1997-09-07T00:00:00.000' AS DateTime), N'Sunday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (617, CAST(N'1997-09-08T00:00:00.000' AS DateTime), N'Monday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (618, CAST(N'1997-09-09T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (619, CAST(N'1997-09-10T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (620, CAST(N'1997-09-11T00:00:00.000' AS DateTime), N'Thursday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (621, CAST(N'1997-09-12T00:00:00.000' AS DateTime), N'Friday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (622, CAST(N'1997-09-13T00:00:00.000' AS DateTime), N'Saturday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (623, CAST(N'1997-09-14T00:00:00.000' AS DateTime), N'Sunday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (624, CAST(N'1997-09-15T00:00:00.000' AS DateTime), N'Monday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (625, CAST(N'1997-09-16T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (626, CAST(N'1997-09-17T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (627, CAST(N'1997-09-18T00:00:00.000' AS DateTime), N'Thursday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (628, CAST(N'1997-09-19T00:00:00.000' AS DateTime), N'Friday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (629, CAST(N'1997-09-20T00:00:00.000' AS DateTime), N'Saturday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (630, CAST(N'1997-09-21T00:00:00.000' AS DateTime), N'Sunday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (631, CAST(N'1997-09-22T00:00:00.000' AS DateTime), N'Monday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (632, CAST(N'1997-09-23T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (633, CAST(N'1997-09-24T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (634, CAST(N'1997-09-25T00:00:00.000' AS DateTime), N'Thursday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (635, CAST(N'1997-09-26T00:00:00.000' AS DateTime), N'Friday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (636, CAST(N'1997-09-27T00:00:00.000' AS DateTime), N'Saturday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (637, CAST(N'1997-09-28T00:00:00.000' AS DateTime), N'Sunday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (638, CAST(N'1997-09-29T00:00:00.000' AS DateTime), N'Monday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (639, CAST(N'1997-09-30T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (640, CAST(N'1997-10-01T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (641, CAST(N'1997-10-02T00:00:00.000' AS DateTime), N'Thursday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (642, CAST(N'1997-10-03T00:00:00.000' AS DateTime), N'Friday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (643, CAST(N'1997-10-04T00:00:00.000' AS DateTime), N'Saturday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (644, CAST(N'1997-10-05T00:00:00.000' AS DateTime), N'Sunday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (645, CAST(N'1997-10-06T00:00:00.000' AS DateTime), N'Monday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (646, CAST(N'1997-10-07T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (647, CAST(N'1997-10-08T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (648, CAST(N'1997-10-09T00:00:00.000' AS DateTime), N'Thursday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (649, CAST(N'1997-10-10T00:00:00.000' AS DateTime), N'Friday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (650, CAST(N'1997-10-11T00:00:00.000' AS DateTime), N'Saturday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (651, CAST(N'1997-10-12T00:00:00.000' AS DateTime), N'Sunday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (652, CAST(N'1997-10-13T00:00:00.000' AS DateTime), N'Monday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (653, CAST(N'1997-10-14T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (654, CAST(N'1997-10-15T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (655, CAST(N'1997-10-16T00:00:00.000' AS DateTime), N'Thursday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (656, CAST(N'1997-10-17T00:00:00.000' AS DateTime), N'Friday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (657, CAST(N'1997-10-18T00:00:00.000' AS DateTime), N'Saturday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (658, CAST(N'1997-10-19T00:00:00.000' AS DateTime), N'Sunday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (659, CAST(N'1997-10-20T00:00:00.000' AS DateTime), N'Monday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (660, CAST(N'1997-10-21T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (661, CAST(N'1997-10-22T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (662, CAST(N'1997-10-23T00:00:00.000' AS DateTime), N'Thursday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (663, CAST(N'1997-10-24T00:00:00.000' AS DateTime), N'Friday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (664, CAST(N'1997-10-25T00:00:00.000' AS DateTime), N'Saturday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (665, CAST(N'1997-10-26T00:00:00.000' AS DateTime), N'Sunday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (666, CAST(N'1997-10-27T00:00:00.000' AS DateTime), N'Monday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (667, CAST(N'1997-10-28T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (668, CAST(N'1997-10-29T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (669, CAST(N'1997-10-30T00:00:00.000' AS DateTime), N'Thursday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (670, CAST(N'1997-10-31T00:00:00.000' AS DateTime), N'Friday', N'October', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (671, CAST(N'1997-11-01T00:00:00.000' AS DateTime), N'Saturday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (672, CAST(N'1997-11-02T00:00:00.000' AS DateTime), N'Sunday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (673, CAST(N'1997-11-03T00:00:00.000' AS DateTime), N'Monday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (674, CAST(N'1997-11-04T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (675, CAST(N'1997-11-05T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (676, CAST(N'1997-11-06T00:00:00.000' AS DateTime), N'Thursday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (677, CAST(N'1997-11-07T00:00:00.000' AS DateTime), N'Friday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (678, CAST(N'1997-11-08T00:00:00.000' AS DateTime), N'Saturday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (679, CAST(N'1997-11-09T00:00:00.000' AS DateTime), N'Sunday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (680, CAST(N'1997-11-10T00:00:00.000' AS DateTime), N'Monday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (681, CAST(N'1997-11-11T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (682, CAST(N'1997-11-12T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (683, CAST(N'1997-11-13T00:00:00.000' AS DateTime), N'Thursday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (684, CAST(N'1997-11-14T00:00:00.000' AS DateTime), N'Friday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (685, CAST(N'1997-11-15T00:00:00.000' AS DateTime), N'Saturday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (686, CAST(N'1997-11-16T00:00:00.000' AS DateTime), N'Sunday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (687, CAST(N'1997-11-17T00:00:00.000' AS DateTime), N'Monday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (688, CAST(N'1997-11-18T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (689, CAST(N'1997-11-19T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (690, CAST(N'1997-11-20T00:00:00.000' AS DateTime), N'Thursday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (691, CAST(N'1997-11-21T00:00:00.000' AS DateTime), N'Friday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (692, CAST(N'1997-11-22T00:00:00.000' AS DateTime), N'Saturday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (693, CAST(N'1997-11-23T00:00:00.000' AS DateTime), N'Sunday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (694, CAST(N'1997-11-24T00:00:00.000' AS DateTime), N'Monday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (695, CAST(N'1997-11-25T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (696, CAST(N'1997-11-26T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (697, CAST(N'1997-11-27T00:00:00.000' AS DateTime), N'Thursday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (698, CAST(N'1997-11-28T00:00:00.000' AS DateTime), N'Friday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (699, CAST(N'1997-11-29T00:00:00.000' AS DateTime), N'Saturday', N'November', 1997)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (700, CAST(N'1997-11-30T00:00:00.000' AS DateTime), N'Sunday', N'November', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (701, CAST(N'1997-12-01T00:00:00.000' AS DateTime), N'Monday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (702, CAST(N'1997-12-02T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (703, CAST(N'1997-12-03T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (704, CAST(N'1997-12-04T00:00:00.000' AS DateTime), N'Thursday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (705, CAST(N'1997-12-05T00:00:00.000' AS DateTime), N'Friday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (706, CAST(N'1997-12-06T00:00:00.000' AS DateTime), N'Saturday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (707, CAST(N'1997-12-07T00:00:00.000' AS DateTime), N'Sunday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (708, CAST(N'1997-12-08T00:00:00.000' AS DateTime), N'Monday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (709, CAST(N'1997-12-09T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (710, CAST(N'1997-12-10T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (711, CAST(N'1997-12-11T00:00:00.000' AS DateTime), N'Thursday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (712, CAST(N'1997-12-12T00:00:00.000' AS DateTime), N'Friday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (713, CAST(N'1997-12-13T00:00:00.000' AS DateTime), N'Saturday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (714, CAST(N'1997-12-14T00:00:00.000' AS DateTime), N'Sunday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (715, CAST(N'1997-12-15T00:00:00.000' AS DateTime), N'Monday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (716, CAST(N'1997-12-16T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (717, CAST(N'1997-12-17T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (718, CAST(N'1997-12-18T00:00:00.000' AS DateTime), N'Thursday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (719, CAST(N'1997-12-19T00:00:00.000' AS DateTime), N'Friday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (720, CAST(N'1997-12-20T00:00:00.000' AS DateTime), N'Saturday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (721, CAST(N'1997-12-21T00:00:00.000' AS DateTime), N'Sunday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (722, CAST(N'1997-12-22T00:00:00.000' AS DateTime), N'Monday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (723, CAST(N'1997-12-23T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (724, CAST(N'1997-12-24T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (725, CAST(N'1997-12-25T00:00:00.000' AS DateTime), N'Thursday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (726, CAST(N'1997-12-26T00:00:00.000' AS DateTime), N'Friday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (727, CAST(N'1997-12-27T00:00:00.000' AS DateTime), N'Saturday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (728, CAST(N'1997-12-28T00:00:00.000' AS DateTime), N'Sunday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (729, CAST(N'1997-12-29T00:00:00.000' AS DateTime), N'Monday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (730, CAST(N'1997-12-30T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (731, CAST(N'1997-12-31T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1997)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (732, CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'Thursday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (733, CAST(N'1998-01-02T00:00:00.000' AS DateTime), N'Friday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (734, CAST(N'1998-01-03T00:00:00.000' AS DateTime), N'Saturday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (735, CAST(N'1998-01-04T00:00:00.000' AS DateTime), N'Sunday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (736, CAST(N'1998-01-05T00:00:00.000' AS DateTime), N'Monday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (737, CAST(N'1998-01-06T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (738, CAST(N'1998-01-07T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (739, CAST(N'1998-01-08T00:00:00.000' AS DateTime), N'Thursday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (740, CAST(N'1998-01-09T00:00:00.000' AS DateTime), N'Friday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (741, CAST(N'1998-01-10T00:00:00.000' AS DateTime), N'Saturday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (742, CAST(N'1998-01-11T00:00:00.000' AS DateTime), N'Sunday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (743, CAST(N'1998-01-12T00:00:00.000' AS DateTime), N'Monday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (744, CAST(N'1998-01-13T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (745, CAST(N'1998-01-14T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (746, CAST(N'1998-01-15T00:00:00.000' AS DateTime), N'Thursday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (747, CAST(N'1998-01-16T00:00:00.000' AS DateTime), N'Friday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (748, CAST(N'1998-01-17T00:00:00.000' AS DateTime), N'Saturday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (749, CAST(N'1998-01-18T00:00:00.000' AS DateTime), N'Sunday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (750, CAST(N'1998-01-19T00:00:00.000' AS DateTime), N'Monday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (751, CAST(N'1998-01-20T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (752, CAST(N'1998-01-21T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (753, CAST(N'1998-01-22T00:00:00.000' AS DateTime), N'Thursday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (754, CAST(N'1998-01-23T00:00:00.000' AS DateTime), N'Friday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (755, CAST(N'1998-01-24T00:00:00.000' AS DateTime), N'Saturday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (756, CAST(N'1998-01-25T00:00:00.000' AS DateTime), N'Sunday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (757, CAST(N'1998-01-26T00:00:00.000' AS DateTime), N'Monday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (758, CAST(N'1998-01-27T00:00:00.000' AS DateTime), N'Tuesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (759, CAST(N'1998-01-28T00:00:00.000' AS DateTime), N'Wednesday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (760, CAST(N'1998-01-29T00:00:00.000' AS DateTime), N'Thursday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (761, CAST(N'1998-01-30T00:00:00.000' AS DateTime), N'Friday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (762, CAST(N'1998-01-31T00:00:00.000' AS DateTime), N'Saturday', N'January', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (763, CAST(N'1998-02-01T00:00:00.000' AS DateTime), N'Sunday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (764, CAST(N'1998-02-02T00:00:00.000' AS DateTime), N'Monday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (765, CAST(N'1998-02-03T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (766, CAST(N'1998-02-04T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (767, CAST(N'1998-02-05T00:00:00.000' AS DateTime), N'Thursday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (768, CAST(N'1998-02-06T00:00:00.000' AS DateTime), N'Friday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (769, CAST(N'1998-02-07T00:00:00.000' AS DateTime), N'Saturday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (770, CAST(N'1998-02-08T00:00:00.000' AS DateTime), N'Sunday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (771, CAST(N'1998-02-09T00:00:00.000' AS DateTime), N'Monday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (772, CAST(N'1998-02-10T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (773, CAST(N'1998-02-11T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (774, CAST(N'1998-02-12T00:00:00.000' AS DateTime), N'Thursday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (775, CAST(N'1998-02-13T00:00:00.000' AS DateTime), N'Friday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (776, CAST(N'1998-02-14T00:00:00.000' AS DateTime), N'Saturday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (777, CAST(N'1998-02-15T00:00:00.000' AS DateTime), N'Sunday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (778, CAST(N'1998-02-16T00:00:00.000' AS DateTime), N'Monday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (779, CAST(N'1998-02-17T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (780, CAST(N'1998-02-18T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (781, CAST(N'1998-02-19T00:00:00.000' AS DateTime), N'Thursday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (782, CAST(N'1998-02-20T00:00:00.000' AS DateTime), N'Friday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (783, CAST(N'1998-02-21T00:00:00.000' AS DateTime), N'Saturday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (784, CAST(N'1998-02-22T00:00:00.000' AS DateTime), N'Sunday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (785, CAST(N'1998-02-23T00:00:00.000' AS DateTime), N'Monday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (786, CAST(N'1998-02-24T00:00:00.000' AS DateTime), N'Tuesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (787, CAST(N'1998-02-25T00:00:00.000' AS DateTime), N'Wednesday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (788, CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'Thursday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (789, CAST(N'1998-02-27T00:00:00.000' AS DateTime), N'Friday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (790, CAST(N'1998-02-28T00:00:00.000' AS DateTime), N'Saturday', N'February', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (791, CAST(N'1998-03-01T00:00:00.000' AS DateTime), N'Sunday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (792, CAST(N'1998-03-02T00:00:00.000' AS DateTime), N'Monday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (793, CAST(N'1998-03-03T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (794, CAST(N'1998-03-04T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (795, CAST(N'1998-03-05T00:00:00.000' AS DateTime), N'Thursday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (796, CAST(N'1998-03-06T00:00:00.000' AS DateTime), N'Friday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (797, CAST(N'1998-03-07T00:00:00.000' AS DateTime), N'Saturday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (798, CAST(N'1998-03-08T00:00:00.000' AS DateTime), N'Sunday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (799, CAST(N'1998-03-09T00:00:00.000' AS DateTime), N'Monday', N'March', 1998)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (800, CAST(N'1998-03-10T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (801, CAST(N'1998-03-11T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (802, CAST(N'1998-03-12T00:00:00.000' AS DateTime), N'Thursday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (803, CAST(N'1998-03-13T00:00:00.000' AS DateTime), N'Friday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (804, CAST(N'1998-03-14T00:00:00.000' AS DateTime), N'Saturday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (805, CAST(N'1998-03-15T00:00:00.000' AS DateTime), N'Sunday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (806, CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Monday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (807, CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (808, CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (809, CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Thursday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (810, CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'Friday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (811, CAST(N'1998-03-21T00:00:00.000' AS DateTime), N'Saturday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (812, CAST(N'1998-03-22T00:00:00.000' AS DateTime), N'Sunday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (813, CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Monday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (814, CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (815, CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'Wednesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (816, CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Thursday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (817, CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'Friday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (818, CAST(N'1998-03-28T00:00:00.000' AS DateTime), N'Saturday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (819, CAST(N'1998-03-29T00:00:00.000' AS DateTime), N'Sunday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (820, CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'Monday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (821, CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'Tuesday', N'March', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (822, CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (823, CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Thursday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (824, CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'Friday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (825, CAST(N'1998-04-04T00:00:00.000' AS DateTime), N'Saturday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (826, CAST(N'1998-04-05T00:00:00.000' AS DateTime), N'Sunday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (827, CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'Monday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (828, CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (829, CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (830, CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Thursday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (831, CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Friday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (832, CAST(N'1998-04-11T00:00:00.000' AS DateTime), N'Saturday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (833, CAST(N'1998-04-12T00:00:00.000' AS DateTime), N'Sunday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (834, CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'Monday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (835, CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (836, CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (837, CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'Thursday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (838, CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'Friday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (839, CAST(N'1998-04-18T00:00:00.000' AS DateTime), N'Saturday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (840, CAST(N'1998-04-19T00:00:00.000' AS DateTime), N'Sunday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (841, CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'Monday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (842, CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (843, CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (844, CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'Thursday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (845, CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'Friday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (846, CAST(N'1998-04-25T00:00:00.000' AS DateTime), N'Saturday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (847, CAST(N'1998-04-26T00:00:00.000' AS DateTime), N'Sunday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (848, CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Monday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (849, CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'Tuesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (850, CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'Wednesday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (851, CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'Thursday', N'April', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (852, CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'Friday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (853, CAST(N'1998-05-02T00:00:00.000' AS DateTime), N'Saturday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (854, CAST(N'1998-05-03T00:00:00.000' AS DateTime), N'Sunday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (855, CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Monday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (856, CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (857, CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (858, CAST(N'1998-05-07T00:00:00.000' AS DateTime), N'Thursday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (859, CAST(N'1998-05-08T00:00:00.000' AS DateTime), N'Friday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (860, CAST(N'1998-05-09T00:00:00.000' AS DateTime), N'Saturday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (861, CAST(N'1998-05-10T00:00:00.000' AS DateTime), N'Sunday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (862, CAST(N'1998-05-11T00:00:00.000' AS DateTime), N'Monday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (863, CAST(N'1998-05-12T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (864, CAST(N'1998-05-13T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (865, CAST(N'1998-05-14T00:00:00.000' AS DateTime), N'Thursday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (866, CAST(N'1998-05-15T00:00:00.000' AS DateTime), N'Friday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (867, CAST(N'1998-05-16T00:00:00.000' AS DateTime), N'Saturday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (868, CAST(N'1998-05-17T00:00:00.000' AS DateTime), N'Sunday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (869, CAST(N'1998-05-18T00:00:00.000' AS DateTime), N'Monday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (870, CAST(N'1998-05-19T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (871, CAST(N'1998-05-20T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (872, CAST(N'1998-05-21T00:00:00.000' AS DateTime), N'Thursday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (873, CAST(N'1998-05-22T00:00:00.000' AS DateTime), N'Friday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (874, CAST(N'1998-05-23T00:00:00.000' AS DateTime), N'Saturday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (875, CAST(N'1998-05-24T00:00:00.000' AS DateTime), N'Sunday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (876, CAST(N'1998-05-25T00:00:00.000' AS DateTime), N'Monday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (877, CAST(N'1998-05-26T00:00:00.000' AS DateTime), N'Tuesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (878, CAST(N'1998-05-27T00:00:00.000' AS DateTime), N'Wednesday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (879, CAST(N'1998-05-28T00:00:00.000' AS DateTime), N'Thursday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (880, CAST(N'1998-05-29T00:00:00.000' AS DateTime), N'Friday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (881, CAST(N'1998-05-30T00:00:00.000' AS DateTime), N'Saturday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (882, CAST(N'1998-05-31T00:00:00.000' AS DateTime), N'Sunday', N'May', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (883, CAST(N'1998-06-01T00:00:00.000' AS DateTime), N'Monday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (884, CAST(N'1998-06-02T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (885, CAST(N'1998-06-03T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (886, CAST(N'1998-06-04T00:00:00.000' AS DateTime), N'Thursday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (887, CAST(N'1998-06-05T00:00:00.000' AS DateTime), N'Friday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (888, CAST(N'1998-06-06T00:00:00.000' AS DateTime), N'Saturday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (889, CAST(N'1998-06-07T00:00:00.000' AS DateTime), N'Sunday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (890, CAST(N'1998-06-08T00:00:00.000' AS DateTime), N'Monday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (891, CAST(N'1998-06-09T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (892, CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (893, CAST(N'1998-06-11T00:00:00.000' AS DateTime), N'Thursday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (894, CAST(N'1998-06-12T00:00:00.000' AS DateTime), N'Friday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (895, CAST(N'1998-06-13T00:00:00.000' AS DateTime), N'Saturday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (896, CAST(N'1998-06-14T00:00:00.000' AS DateTime), N'Sunday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (897, CAST(N'1998-06-15T00:00:00.000' AS DateTime), N'Monday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (898, CAST(N'1998-06-16T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (899, CAST(N'1998-06-17T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1998)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (900, CAST(N'1998-06-18T00:00:00.000' AS DateTime), N'Thursday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (901, CAST(N'1998-06-19T00:00:00.000' AS DateTime), N'Friday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (902, CAST(N'1998-06-20T00:00:00.000' AS DateTime), N'Saturday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (903, CAST(N'1998-06-21T00:00:00.000' AS DateTime), N'Sunday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (904, CAST(N'1998-06-22T00:00:00.000' AS DateTime), N'Monday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (905, CAST(N'1998-06-23T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (906, CAST(N'1998-06-24T00:00:00.000' AS DateTime), N'Wednesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (907, CAST(N'1998-06-25T00:00:00.000' AS DateTime), N'Thursday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (908, CAST(N'1998-06-26T00:00:00.000' AS DateTime), N'Friday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (909, CAST(N'1998-06-27T00:00:00.000' AS DateTime), N'Saturday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (910, CAST(N'1998-06-28T00:00:00.000' AS DateTime), N'Sunday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (911, CAST(N'1998-06-29T00:00:00.000' AS DateTime), N'Monday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (912, CAST(N'1998-06-30T00:00:00.000' AS DateTime), N'Tuesday', N'June', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (913, CAST(N'1998-07-01T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (914, CAST(N'1998-07-02T00:00:00.000' AS DateTime), N'Thursday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (915, CAST(N'1998-07-03T00:00:00.000' AS DateTime), N'Friday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (916, CAST(N'1998-07-04T00:00:00.000' AS DateTime), N'Saturday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (917, CAST(N'1998-07-05T00:00:00.000' AS DateTime), N'Sunday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (918, CAST(N'1998-07-06T00:00:00.000' AS DateTime), N'Monday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (919, CAST(N'1998-07-07T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (920, CAST(N'1998-07-08T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (921, CAST(N'1998-07-09T00:00:00.000' AS DateTime), N'Thursday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (922, CAST(N'1998-07-10T00:00:00.000' AS DateTime), N'Friday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (923, CAST(N'1998-07-11T00:00:00.000' AS DateTime), N'Saturday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (924, CAST(N'1998-07-12T00:00:00.000' AS DateTime), N'Sunday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (925, CAST(N'1998-07-13T00:00:00.000' AS DateTime), N'Monday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (926, CAST(N'1998-07-14T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (927, CAST(N'1998-07-15T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (928, CAST(N'1998-07-16T00:00:00.000' AS DateTime), N'Thursday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (929, CAST(N'1998-07-17T00:00:00.000' AS DateTime), N'Friday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (930, CAST(N'1998-07-18T00:00:00.000' AS DateTime), N'Saturday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (931, CAST(N'1998-07-19T00:00:00.000' AS DateTime), N'Sunday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (932, CAST(N'1998-07-20T00:00:00.000' AS DateTime), N'Monday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (933, CAST(N'1998-07-21T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (934, CAST(N'1998-07-22T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (935, CAST(N'1998-07-23T00:00:00.000' AS DateTime), N'Thursday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (936, CAST(N'1998-07-24T00:00:00.000' AS DateTime), N'Friday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (937, CAST(N'1998-07-25T00:00:00.000' AS DateTime), N'Saturday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (938, CAST(N'1998-07-26T00:00:00.000' AS DateTime), N'Sunday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (939, CAST(N'1998-07-27T00:00:00.000' AS DateTime), N'Monday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (940, CAST(N'1998-07-28T00:00:00.000' AS DateTime), N'Tuesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (941, CAST(N'1998-07-29T00:00:00.000' AS DateTime), N'Wednesday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (942, CAST(N'1998-07-30T00:00:00.000' AS DateTime), N'Thursday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (943, CAST(N'1998-07-31T00:00:00.000' AS DateTime), N'Friday', N'July', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (944, CAST(N'1998-08-01T00:00:00.000' AS DateTime), N'Saturday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (945, CAST(N'1998-08-02T00:00:00.000' AS DateTime), N'Sunday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (946, CAST(N'1998-08-03T00:00:00.000' AS DateTime), N'Monday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (947, CAST(N'1998-08-04T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (948, CAST(N'1998-08-05T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (949, CAST(N'1998-08-06T00:00:00.000' AS DateTime), N'Thursday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (950, CAST(N'1998-08-07T00:00:00.000' AS DateTime), N'Friday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (951, CAST(N'1998-08-08T00:00:00.000' AS DateTime), N'Saturday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (952, CAST(N'1998-08-09T00:00:00.000' AS DateTime), N'Sunday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (953, CAST(N'1998-08-10T00:00:00.000' AS DateTime), N'Monday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (954, CAST(N'1998-08-11T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (955, CAST(N'1998-08-12T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (956, CAST(N'1998-08-13T00:00:00.000' AS DateTime), N'Thursday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (957, CAST(N'1998-08-14T00:00:00.000' AS DateTime), N'Friday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (958, CAST(N'1998-08-15T00:00:00.000' AS DateTime), N'Saturday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (959, CAST(N'1998-08-16T00:00:00.000' AS DateTime), N'Sunday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (960, CAST(N'1998-08-17T00:00:00.000' AS DateTime), N'Monday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (961, CAST(N'1998-08-18T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (962, CAST(N'1998-08-19T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (963, CAST(N'1998-08-20T00:00:00.000' AS DateTime), N'Thursday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (964, CAST(N'1998-08-21T00:00:00.000' AS DateTime), N'Friday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (965, CAST(N'1998-08-22T00:00:00.000' AS DateTime), N'Saturday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (966, CAST(N'1998-08-23T00:00:00.000' AS DateTime), N'Sunday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (967, CAST(N'1998-08-24T00:00:00.000' AS DateTime), N'Monday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (968, CAST(N'1998-08-25T00:00:00.000' AS DateTime), N'Tuesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (969, CAST(N'1998-08-26T00:00:00.000' AS DateTime), N'Wednesday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (970, CAST(N'1998-08-27T00:00:00.000' AS DateTime), N'Thursday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (971, CAST(N'1998-08-28T00:00:00.000' AS DateTime), N'Friday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (972, CAST(N'1998-08-29T00:00:00.000' AS DateTime), N'Saturday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (973, CAST(N'1998-08-30T00:00:00.000' AS DateTime), N'Sunday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (974, CAST(N'1998-08-31T00:00:00.000' AS DateTime), N'Monday', N'August', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (975, CAST(N'1998-09-01T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (976, CAST(N'1998-09-02T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (977, CAST(N'1998-09-03T00:00:00.000' AS DateTime), N'Thursday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (978, CAST(N'1998-09-04T00:00:00.000' AS DateTime), N'Friday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (979, CAST(N'1998-09-05T00:00:00.000' AS DateTime), N'Saturday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (980, CAST(N'1998-09-06T00:00:00.000' AS DateTime), N'Sunday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (981, CAST(N'1998-09-07T00:00:00.000' AS DateTime), N'Monday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (982, CAST(N'1998-09-08T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (983, CAST(N'1998-09-09T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (984, CAST(N'1998-09-10T00:00:00.000' AS DateTime), N'Thursday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (985, CAST(N'1998-09-11T00:00:00.000' AS DateTime), N'Friday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (986, CAST(N'1998-09-12T00:00:00.000' AS DateTime), N'Saturday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (987, CAST(N'1998-09-13T00:00:00.000' AS DateTime), N'Sunday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (988, CAST(N'1998-09-14T00:00:00.000' AS DateTime), N'Monday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (989, CAST(N'1998-09-15T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (990, CAST(N'1998-09-16T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (991, CAST(N'1998-09-17T00:00:00.000' AS DateTime), N'Thursday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (992, CAST(N'1998-09-18T00:00:00.000' AS DateTime), N'Friday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (993, CAST(N'1998-09-19T00:00:00.000' AS DateTime), N'Saturday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (994, CAST(N'1998-09-20T00:00:00.000' AS DateTime), N'Sunday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (995, CAST(N'1998-09-21T00:00:00.000' AS DateTime), N'Monday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (996, CAST(N'1998-09-22T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (997, CAST(N'1998-09-23T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (998, CAST(N'1998-09-24T00:00:00.000' AS DateTime), N'Thursday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (999, CAST(N'1998-09-25T00:00:00.000' AS DateTime), N'Friday', N'September', 1998)
GO
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1000, CAST(N'1998-09-26T00:00:00.000' AS DateTime), N'Saturday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1001, CAST(N'1998-09-27T00:00:00.000' AS DateTime), N'Sunday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1002, CAST(N'1998-09-28T00:00:00.000' AS DateTime), N'Monday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1003, CAST(N'1998-09-29T00:00:00.000' AS DateTime), N'Tuesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1004, CAST(N'1998-09-30T00:00:00.000' AS DateTime), N'Wednesday', N'September', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1005, CAST(N'1998-10-01T00:00:00.000' AS DateTime), N'Thursday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1006, CAST(N'1998-10-02T00:00:00.000' AS DateTime), N'Friday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1007, CAST(N'1998-10-03T00:00:00.000' AS DateTime), N'Saturday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1008, CAST(N'1998-10-04T00:00:00.000' AS DateTime), N'Sunday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1009, CAST(N'1998-10-05T00:00:00.000' AS DateTime), N'Monday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1010, CAST(N'1998-10-06T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1011, CAST(N'1998-10-07T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1012, CAST(N'1998-10-08T00:00:00.000' AS DateTime), N'Thursday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1013, CAST(N'1998-10-09T00:00:00.000' AS DateTime), N'Friday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1014, CAST(N'1998-10-10T00:00:00.000' AS DateTime), N'Saturday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1015, CAST(N'1998-10-11T00:00:00.000' AS DateTime), N'Sunday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1016, CAST(N'1998-10-12T00:00:00.000' AS DateTime), N'Monday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1017, CAST(N'1998-10-13T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1018, CAST(N'1998-10-14T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1019, CAST(N'1998-10-15T00:00:00.000' AS DateTime), N'Thursday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1020, CAST(N'1998-10-16T00:00:00.000' AS DateTime), N'Friday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1021, CAST(N'1998-10-17T00:00:00.000' AS DateTime), N'Saturday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1022, CAST(N'1998-10-18T00:00:00.000' AS DateTime), N'Sunday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1023, CAST(N'1998-10-19T00:00:00.000' AS DateTime), N'Monday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1024, CAST(N'1998-10-20T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1025, CAST(N'1998-10-21T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1026, CAST(N'1998-10-22T00:00:00.000' AS DateTime), N'Thursday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1027, CAST(N'1998-10-23T00:00:00.000' AS DateTime), N'Friday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1028, CAST(N'1998-10-24T00:00:00.000' AS DateTime), N'Saturday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1029, CAST(N'1998-10-25T00:00:00.000' AS DateTime), N'Sunday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1030, CAST(N'1998-10-26T00:00:00.000' AS DateTime), N'Monday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1031, CAST(N'1998-10-27T00:00:00.000' AS DateTime), N'Tuesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1032, CAST(N'1998-10-28T00:00:00.000' AS DateTime), N'Wednesday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1033, CAST(N'1998-10-29T00:00:00.000' AS DateTime), N'Thursday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1034, CAST(N'1998-10-30T00:00:00.000' AS DateTime), N'Friday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1035, CAST(N'1998-10-31T00:00:00.000' AS DateTime), N'Saturday', N'October', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1036, CAST(N'1998-11-01T00:00:00.000' AS DateTime), N'Sunday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1037, CAST(N'1998-11-02T00:00:00.000' AS DateTime), N'Monday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1038, CAST(N'1998-11-03T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1039, CAST(N'1998-11-04T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1040, CAST(N'1998-11-05T00:00:00.000' AS DateTime), N'Thursday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1041, CAST(N'1998-11-06T00:00:00.000' AS DateTime), N'Friday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1042, CAST(N'1998-11-07T00:00:00.000' AS DateTime), N'Saturday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1043, CAST(N'1998-11-08T00:00:00.000' AS DateTime), N'Sunday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1044, CAST(N'1998-11-09T00:00:00.000' AS DateTime), N'Monday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1045, CAST(N'1998-11-10T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1046, CAST(N'1998-11-11T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1047, CAST(N'1998-11-12T00:00:00.000' AS DateTime), N'Thursday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1048, CAST(N'1998-11-13T00:00:00.000' AS DateTime), N'Friday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1049, CAST(N'1998-11-14T00:00:00.000' AS DateTime), N'Saturday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1050, CAST(N'1998-11-15T00:00:00.000' AS DateTime), N'Sunday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1051, CAST(N'1998-11-16T00:00:00.000' AS DateTime), N'Monday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1052, CAST(N'1998-11-17T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1053, CAST(N'1998-11-18T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1054, CAST(N'1998-11-19T00:00:00.000' AS DateTime), N'Thursday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1055, CAST(N'1998-11-20T00:00:00.000' AS DateTime), N'Friday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1056, CAST(N'1998-11-21T00:00:00.000' AS DateTime), N'Saturday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1057, CAST(N'1998-11-22T00:00:00.000' AS DateTime), N'Sunday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1058, CAST(N'1998-11-23T00:00:00.000' AS DateTime), N'Monday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1059, CAST(N'1998-11-24T00:00:00.000' AS DateTime), N'Tuesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1060, CAST(N'1998-11-25T00:00:00.000' AS DateTime), N'Wednesday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1061, CAST(N'1998-11-26T00:00:00.000' AS DateTime), N'Thursday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1062, CAST(N'1998-11-27T00:00:00.000' AS DateTime), N'Friday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1063, CAST(N'1998-11-28T00:00:00.000' AS DateTime), N'Saturday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1064, CAST(N'1998-11-29T00:00:00.000' AS DateTime), N'Sunday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1065, CAST(N'1998-11-30T00:00:00.000' AS DateTime), N'Monday', N'November', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1066, CAST(N'1998-12-01T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1067, CAST(N'1998-12-02T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1068, CAST(N'1998-12-03T00:00:00.000' AS DateTime), N'Thursday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1069, CAST(N'1998-12-04T00:00:00.000' AS DateTime), N'Friday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1070, CAST(N'1998-12-05T00:00:00.000' AS DateTime), N'Saturday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1071, CAST(N'1998-12-06T00:00:00.000' AS DateTime), N'Sunday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1072, CAST(N'1998-12-07T00:00:00.000' AS DateTime), N'Monday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1073, CAST(N'1998-12-08T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1074, CAST(N'1998-12-09T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1075, CAST(N'1998-12-10T00:00:00.000' AS DateTime), N'Thursday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1076, CAST(N'1998-12-11T00:00:00.000' AS DateTime), N'Friday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1077, CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'Saturday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1078, CAST(N'1998-12-13T00:00:00.000' AS DateTime), N'Sunday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1079, CAST(N'1998-12-14T00:00:00.000' AS DateTime), N'Monday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1080, CAST(N'1998-12-15T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1081, CAST(N'1998-12-16T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1082, CAST(N'1998-12-17T00:00:00.000' AS DateTime), N'Thursday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1083, CAST(N'1998-12-18T00:00:00.000' AS DateTime), N'Friday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1084, CAST(N'1998-12-19T00:00:00.000' AS DateTime), N'Saturday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1085, CAST(N'1998-12-20T00:00:00.000' AS DateTime), N'Sunday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1086, CAST(N'1998-12-21T00:00:00.000' AS DateTime), N'Monday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1087, CAST(N'1998-12-22T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1088, CAST(N'1998-12-23T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1089, CAST(N'1998-12-24T00:00:00.000' AS DateTime), N'Thursday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1090, CAST(N'1998-12-25T00:00:00.000' AS DateTime), N'Friday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1091, CAST(N'1998-12-26T00:00:00.000' AS DateTime), N'Saturday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1092, CAST(N'1998-12-27T00:00:00.000' AS DateTime), N'Sunday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1093, CAST(N'1998-12-28T00:00:00.000' AS DateTime), N'Monday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1094, CAST(N'1998-12-29T00:00:00.000' AS DateTime), N'Tuesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1095, CAST(N'1998-12-30T00:00:00.000' AS DateTime), N'Wednesday', N'December', 1998)
INSERT [dbo].[Calendar] ([DateID], [CalendarDate], [WeekDayName], [MonthName], [Year]) VALUES (1096, CAST(N'1998-12-31T00:00:00.000' AS DateTime), N'Thursday', N'December', 1998)
SET IDENTITY_INSERT [dbo].[Calendar] OFF
INSERT [dbo].[Validator] ([CurrentValid]) VALUES('31/12/1997')
