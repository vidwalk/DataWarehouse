DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Customer]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Employee]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Supplier]
DELETE FROM [OrderSaleProcess].[dbo].[stage_dim_Shipper]
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
[OrderSaleProcess].[dbo].[stage_dim_Supplier](
[SupplierID]
,[CompanyName]
)
SELECT
[SupplierID]
,[CompanyName]
FROM [northwindDB].[dbo].[Suppliers]

INSERT INTO
[OrderSaleProcess].[dbo].[stage_dim_Shipper](
[ShipperID]
,[CompanyName]
)
SELECT
[ShipperID]
,[CompanyName]
FROM [northwindDB].[dbo].[Shippers]

INSERT INTO
[OrderSaleProcess].[dbo].[stage_dim_Product](
[ProductID]
,[UnitPrice]
,[ProductName]
,[UnitsInStock]
)
SELECT
[ProductID],
[UnitPrice],
[ProductName],
[UnitsInStock]
FROM [northwindDB].[dbo].[Products]