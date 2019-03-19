USE [OrderSaleProcess]
GO

INSERT INTO [dbo].[Customer]
           ([CustomerID]
           ,[Country])
     SELECT
	 [CustomerID]
	 ,[Country]
	FROM [stage_dim_Customer]

INSERT INTO [dbo].[Employee]
           ([EmployeeID]
           ,[LastName]
           ,[FirstName])
	SELECT
	[EmployeeID]
    ,[LastName]
    ,[FirstName]
	FROM [stage_dim_Employee]

INSERT INTO [dbo].[Product]
           ([ProductID]
           ,[UnitPrice]
           ,[ProductName]
           ,[UnitsInStock])
	SELECT
	[ProductID]
    ,[UnitPrice]
    ,[ProductName]
    ,[UnitsInStock]
	FROM [stage_dim_Product]

INSERT INTO [dbo].[Shipper]
           ([ShipperID]
           ,[CompanyName])
	SELECT
	[ShipperID]
    ,[CompanyName]
	FROM [stage_dim_Shipper]

INSERT INTO [dbo].[Supplier]
           ([SupplierID]
           ,[CompanyName])
	SELECT
	[SupplierID]
    ,[CompanyName]
	FROM [stage_dim_Supplier]

GO
