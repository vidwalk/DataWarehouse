use [OrderSaleProcess]

INSERT INTO 
 [dbo].[stage_dim_Product](
  [ProductID]
 ,[ProductName]
 ,[UnitsInStock]
 ,[SupplierName]
 )
 SELECT [northwindDB].[dbo].[Products].[ProductID], [northwindDB].[dbo].[Products].[ProductName],
 [northwindDB].[dbo].[Suppliers].[CompanyName],
 FROM [northwindDB].[dbo].[Products]
 JOIN [northwindDB].[dbo].[Suppliers] ON 
 [northwindDB].[dbo].[Products].[SupplierID] = [northwindDB].[dbo].[Suppliers].[SupplierID]
