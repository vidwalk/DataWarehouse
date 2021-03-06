USE [OrderSaleProcess]
GO
---Inserting from the stage to the dimension
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
---After inserting the values, we set the columns validfrom and validto
UPDATE Customer
SET Customer.validFrom='01/01/1996',Customer.validTo = '12/31/9999'
UPDATE Employee
SET Employee.validFrom='01/01/1996',Employee.validTo = '12/31/9997'
UPDATE Product
SET Product.validFrom='01/01/1996',Product.validTo = '12/31/9997'
