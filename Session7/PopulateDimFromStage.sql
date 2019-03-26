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
           ,[ProductName]
           ,[SupplierName])
	SELECT
	[ProductID]
    ,[ProductName]
    ,[SupplierName]
	FROM [stage_dim_Product]

UPDATE Customer
SET Customer.validFrom='01/01/1996',Customer.validTo = '12/31/1997'
UPDATE Employee
SET Employee.validFrom='01/01/1996',Employee.validTo = '12/31/1997'
UPDATE Product
SET Product.validFrom='01/01/1996',Product.validTo = '12/31/1997'
