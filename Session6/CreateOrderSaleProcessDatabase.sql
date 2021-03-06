USE [OrderSaleProcess]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[F_Order]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[P_ID] [int] NULL,
	[SH_ID] [int] NULL,
	[SP_ID] [int] NULL,
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
/****** Object:  Table [dbo].[Product]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[SH_ID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[SH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Customer]    Script Date: 13/03/2019 09:11:50 ******/
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
/****** Object:  Table [dbo].[stage_dim_Employee]    Script Date: 13/03/2019 09:11:50 ******/
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
/****** Object:  Table [dbo].[stage_dim_Product]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](9, 2) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
 CONSTRAINT [PK_P_ID] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Shipper]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Shipper](
	[SH_ID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SH_ID] PRIMARY KEY CLUSTERED 
(
	[SH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_dim_Supplier]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_dim_Supplier](
	[SP_ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SP_ID] PRIMARY KEY CLUSTERED 
(
	[SP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SP_ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_order]    Script Date: 13/03/2019 09:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_order](
	[C_ID] [int] NULL,
	[E_ID] [int] NULL,
	[P_ID] [int] NULL,
	[D_ID] [int] NULL,
	[SH_ID] [int] NULL,
	[SP_ID] [int] NULL,
	[CustomerID] [nchar](10) NULL,
	[ProductID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipperID] [int] NULL,
	[SupplierID] [int] NULL,
	[Quantity] [smallint] NULL,
	[SalesAmount] [money] NULL,
	[Discount] [real] NULL
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
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Shipper] FOREIGN KEY([SH_ID])
REFERENCES [dbo].[Shipper] ([SH_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Shipper]
GO
ALTER TABLE [dbo].[F_Order]  WITH CHECK ADD  CONSTRAINT [FK_F_Order_Supplier] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[Supplier] ([SP_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[F_Order] CHECK CONSTRAINT [FK_F_Order_Supplier]
GO
