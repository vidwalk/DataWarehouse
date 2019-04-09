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
 [dbo].[stage_dim_Product](
  [ProductID]
 ,[ProductName]
 ,[SupplierName]
 )
 SELECT [northwindDB].[dbo].[Products].[ProductID], [northwindDB].[dbo].[Products].[ProductName],
 [northwindDB].[dbo].[Suppliers].[CompanyName]
 FROM [northwindDB].[dbo].[Products]
 JOIN [northwindDB].[dbo].[Suppliers] ON 
 [northwindDB].[dbo].[Products].[SupplierID] = [northwindDB].[dbo].[Suppliers].[SupplierID]
 --Set the validfrom and validto 
UPDATE state_dim_Customer
SET state_dim_Customer.validFrom='01/01/1996',state_dim_Customer.validTo = '12/31/1997'
UPDATE state_dim_Employee
SET state_dim_Employee.validFrom='01/01/1996',state_dim_Employee.validTo = '12/31/1997'
UPDATE Product
SET state_dim_Product.validFrom='01/01/1996',state_dim_Product.validTo = '12/31/1997'
