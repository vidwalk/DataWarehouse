use NorthWindDB
go
insert into [OrderSaleProcess].[dbo].[temp_fact_order](Quantity,SalesAmount,ProductID,CustomerID,EmployeeID,OrderDate, ShipperID, SupplierID,Discount)
SELECT
Quantity
,[Order Details].UnitPrice * Quantity
,[Products].ProductID
,[Customers].CustomerID
,[Employees].EmployeeID
,[Orders].OrderDate
,Shippers.ShipperID
,Suppliers.SupplierID
,[Order Details].Discount
FROM [Order Details]
Join Orders on Orders.OrderID = [Order Details].OrderID
Join Customers on Orders.CustomerID=Customers.CustomerID
Join Employees on Employees.EmployeeID= Orders.EmployeeID
Join Products on Products.ProductID= [Order Details].ProductID
Join Shippers on Shippers.ShipperID = Orders.ShipVia
Join Suppliers on Suppliers.SupplierID = Products.SupplierID
