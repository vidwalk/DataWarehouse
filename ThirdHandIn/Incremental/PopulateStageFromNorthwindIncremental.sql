DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Customer]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Employee]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Product]
---Populate the stage with the entries from northwind database
INSERT INTO
[OrderSaleProcess].[dbo].[stage_dim_Customer](
[CustomerID]
,[Country]
)
SELECT
[CustomerID]
,[Country]
FROM [northwindDB].[dbo].[Customers]

INSERT INTO
[OrderSaleProcess].[dbo].[stage_dim_Employee](
[EmployeeID]
,[LastName]
,[FirstName]
)
SELECT
[EmployeeID]
,[LastName]
,[FirstName]
FROM [northwindDB].[dbo].[Employees]

INSERT INTO 
 [OrderSaleProcess].[dbo].[stage_dim_Product](
  [ProductID]
 ,[ProductName]
 ,[SupplierName]
 )
 SELECT [northwindDB].[dbo].[Products].[ProductID], [northwindDB].[dbo].[Products].[ProductName],
 [northwindDB].[dbo].[Suppliers].[CompanyName]
 FROM [northwindDB].[dbo].[Products]
 JOIN [northwindDB].[dbo].[Suppliers] ON 
 [northwindDB].[dbo].[Products].[SupplierID] = [northwindDB].[dbo].[Suppliers].[SupplierID]
 --Set the validfrom and validto with the current date in validator and a date in the future
UPDATE [OrderSaleProcess].[dbo].[stage_dim_Customer]
SET [OrderSaleProcess].[dbo].[stage_dim_Customer].validFrom=(SELECT MAX(CurrentValid) FROM OrderSaleProcess.dbo.Validator),[OrderSaleProcess].[dbo].[stage_dim_Customer].validTo = '12/31/1997'
UPDATE [OrderSaleProcess].[dbo].[stage_dim_Employee]
SET [OrderSaleProcess].[dbo].[stage_dim_Employee].validFrom=(SELECT MAX(CurrentValid) FROM OrderSaleProcess.dbo.Validator),[OrderSaleProcess].[dbo].[stage_dim_Employee].validTo = '12/31/1997'
UPDATE [OrderSaleProcess].[dbo].[stage_dim_Product]
SET [OrderSaleProcess].[dbo].[stage_dim_Product].validFrom=(SELECT MAX(CurrentValid) FROM OrderSaleProcess.dbo.Validator),[OrderSaleProcess].[dbo].[stage_dim_Product].validTo = '12/31/1997'
