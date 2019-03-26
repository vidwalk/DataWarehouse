DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Customer]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Employee]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Product]

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
