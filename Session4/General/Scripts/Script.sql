use NorthWindDB
go
insert into [OrderSaleProcess].[dbo].[temp_fact_sales](Quantity,[UnitPrice * Quantity],ProductID,CustomerID,EmployeeID,OrderDate, ShipperID, SupplierID)
SELECT
Quantity
,[Order Details].UnitPrice * Quantity
,[Products].ProductID
,Customer.CustomerID
,[Employees].EmployeeID
,[Orders].OrderDate
,Shipper.ShipperID
,Supplier.SupplierID
FROM [Order Details]
Join Orders on Orders.OrderID = [Order Details].OrderID
Join Customer on Orders.CustomerID=Customers.CustomerID
Join Employees on Employees.EmployeeID= Orders.EmployeeID
Join Products on Products.ProductID= [Order Details].ProductID
Join Shipper on Shipper.ShipperID = Orders.ShipVia
Join Supplier on Supplier.SupplierID = Products.SupplierID
