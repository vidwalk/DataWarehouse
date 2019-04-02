use NorthWindDB
go
DELETE FROM [OrderSaleProcess].[dbo].[temp_fact_order]
go

insert into [OrderSaleProcess].[dbo].[temp_fact_order](Quantity,SalesAmount,ProductID,CustomerID,EmployeeID,OrderDate,Discount)
SELECT
Quantity
,[Order Details].UnitPrice * Quantity
,[Products].ProductID
,[Customers].CustomerID
,[Employees].EmployeeID
,[Orders].OrderDate
,[Order Details].Discount
FROM [Order Details]
Join Orders on Orders.OrderID = [Order Details].OrderID
Join Customers on Orders.CustomerID=Customers.CustomerID
Join Employees on Employees.EmployeeID= Orders.EmployeeID
Join Products on Products.ProductID= [Order Details].ProductID
WHERE [Orders].OrderDate <= '12/31/1997'
