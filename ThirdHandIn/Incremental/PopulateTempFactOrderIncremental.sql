use NorthWindDB
go
DELETE FROM [OrderSaleProcess].[dbo].[temp_fact_order]
go
---Insert into the Temporary Fact Order the entries after 12/31/1997 in the Order Details
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
--Retrieve the orders after 31/01/1997
WHERE [Orders].OrderDate > (SELECT CurrentValid FROM OrderSaleProcess.dbo.Validator)
--Insert the value of the latest read into the Validator table which is made to keep track of the latest validTo
UPDATE OrderSaleProcess.dbo.Validator
SET CurrentValid = DATEADD(DAY, 1, (CurrentValid FROM OrderSaleProcess.dbo.Validator));
---This has added 01/01/1998 to the validator