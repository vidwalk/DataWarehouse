---Product
use northwindDB
GO

---update validTo if products have been deleted
UPDATE OrderSaleProcess.dbo.stage_dim_Product
SET validTo = '12/31/1997'
WHERE ProductID IN (
---Getting the entries for yesterday in OrderSaleProcess
(SELECT ProductID
FROM OrderSaleProcess.dbo.Product
EXCEPT 
---Getting the entries for today in the NorthwindDB
SELECT ProductID
FROM Products
JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID)

)


---Find the rows that have been changed
use northwindDB
GO
--- Create a temporary table we will table to store the changed entries
CREATE TABLE OrderSaleProcess.dbo.Product_changed (
	P_ID int IDENTITY(1,1) NOT NULL,
	ProductID int NOT NULL,
	ProductName nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	SupplierName nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	validFrom date NULL,
	validTo date NULL,
	CONSTRAINT PK_P_C_ID PRIMARY KEY (P_ID)
) GO
INSERT INTO OrderSaleProcess.dbo.Product_changed
(ProductID,
ProductName,
SupplierName)
(
(
---Getting the entries for today in the NorthwindDB
SELECT ProductID, ProductName, CompanyName
FROM Products
JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
)
EXCEPT
(
---Getting the entries for yesterday in OrderSaleProcess
SELECT ProductID, ProductName, SupplierName
FROM OrderSaleProcess.dbo.Product
)
)
EXCEPT
(
SELECT ProductID, ProductName, CompanyName
FROM Products
JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
WHERE ProductID NOT IN (
SELECT ProductID 
FROM OrderSaleProcess.dbo.Product)
)
--Update the stage
UPDATE OrderSaleProcess.dbo.stage_dim_Product
SET validTo = '12/31/1997'
WHERE ProductID IN 
(SELECT ProductID
FROM OrderSaleProcess.dbo.Product_changed)

-- Insert the entries from the table with changed values and set the proper validfrom and validto
INSERT INTO OrderSaleProcess.dbo.stage_dim_Product
(ProductID,
ProductName,
SupplierName,
validFrom,
validTo
)
SELECT ProductID, ProductName, SupplierName,'01/01/1998','12/31/9999'
FROM OrderSaleProcess.dbo.Product_changed
go 
DROP TABLE OrderSaleProcess.dbo.Product_changed


---Insert the finded added rows
USE northwindDB
go
INSERT INTO OrderSaleProcess.dbo.stage_dim_Product
(ProductID,
ProductName,
SupplierName,
validFrom,
validTo
)
--find the added rows
SELECT ProductID, ProductName, CompanyName,'01/01/1998','12/31/9999'
FROM Products
JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
WHERE ProductID IN 
((
---Getting the entries for today in the NorthwindDB
SELECT ProductID
FROM Products
JOIN Suppliers on Products.SupplierID = Suppliers.SupplierID
)
EXCEPT 
(
---Getting the entries for yesterday in OrderSaleProcess
SELECT ProductID
FROM OrderSaleProcess.dbo.Product
))

--Employee
use northwindDB
GO

---update validTo based on deleted 
UPDATE OrderSaleProcess.dbo.stage_dim_Employee
SET validTo = '12/31/1997'
WHERE EmployeeID IN (
---yesterday
(SELECT EmployeeID
FROM OrderSaleProcess.dbo.Employee
EXCEPT 
---today
SELECT EmployeeID
FROM Employees
)

)


---Find changed rows
use northwindDB
GO
--- Create a temporary table we will table to store the changed entries
CREATE TABLE OrderSaleProcess.dbo.Employee_changed (
	E_ID int IDENTITY(1,1) NOT NULL,
	EmployeeID int NOT NULL,
	LastName nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FirstName nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	validFrom date NULL,
	validTo date NULL,
	CONSTRAINT PK_E_C_ID PRIMARY KEY (E_ID)
) GO
INSERT INTO OrderSaleProcess.dbo.Employee_changed
(EmployeeID,
LastName,
FirstName)
(
(
---Getting the entries for today in the NorthwindDB
SELECT EmployeeID, LastName, FirstName
FROM Employees
)
EXCEPT
(
---Getting the entries for yesterday in OrderSaleProcess
SELECT EmployeeID, LastName, FirstName
FROM OrderSaleProcess.dbo.Employee
)
)
EXCEPT
(
SELECT EmployeeID, LastName, FirstName
FROM Employees
WHERE EmployeeID NOT IN (
SELECT EmployeeID 
FROM OrderSaleProcess.dbo.Employee)
)
--Update the stage
UPDATE OrderSaleProcess.dbo.stage_dim_Employee
SET validTo = '12/31/1997'
WHERE EmployeeID IN 
(SELECT EmployeeID
FROM OrderSaleProcess.dbo.Employee_changed)

-- Insert the entries from the table with changed values and set the proper validfrom and validto
INSERT INTO OrderSaleProcess.dbo.stage_dim_Employee
(EmployeeID,
LastName,
FirstName,
validFrom,
validTo
)
SELECT EmployeeID, LastName, FirstName,'01/01/1998','12/31/9999'
FROM OrderSaleProcess.dbo.Employee_changed
go 
DROP TABLE OrderSaleProcess.dbo.Employee_changed


---Insert the finded added rows
USE northwindDB
go
INSERT INTO OrderSaleProcess.dbo.stage_dim_Employee
(EmployeeID,
LastName,
FirstName,
validFrom,
validTo
)
--find the added rows
SELECT EmployeeID, LastName, FirstName,'01/01/1998','12/31/9999'
FROM Employees
WHERE EmployeeID IN 
((
---Getting the entries for today in the NorthwindDB
SELECT EmployeeID
FROM Employees
)
EXCEPT 
(
---Getting the entries for yesterday in OrderSaleProcess
SELECT EmployeeID
FROM OrderSaleProcess.dbo.Employee
))


--Customer
use northwindDB
GO

---update validTo based on deleted 
UPDATE OrderSaleProcess.dbo.stage_dim_Customer
SET validTo = '12/31/1997'
WHERE CustomerID IN (
---yesterday
(SELECT CustomerID
FROM OrderSaleProcess.dbo.Customer
EXCEPT 
---Getting the entries for today in the NorthwindDB
SELECT CustomerID
FROM Customers
)

)


---Find changed rows
use northwindDB
GO
--- Create a temporary table we will table to store the changed entries
CREATE TABLE OrderSaleProcess.dbo.Customer_changed (
	C_ID int IDENTITY(1,1) NOT NULL,
	CustomerID nchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Country nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	validFrom date NULL,
	validTo date NULL
) GO
INSERT INTO OrderSaleProcess.dbo.Customer_changed
(CustomerID,
Country)
(
(
---Getting the entries for today in the NorthwindDB
SELECT CustomerID, Country
FROM Customers
)
EXCEPT
(
---Getting the entries for yesterday in OrderSaleProcess
SELECT CustomerID, Country
FROM OrderSaleProcess.dbo.Customer
)
)
EXCEPT
(
SELECT CustomerID, Country
FROM Customers
WHERE CustomerID NOT IN (
SELECT CustomerID 
FROM OrderSaleProcess.dbo.Customer)
)
--Update the stage by setting validTo
UPDATE OrderSaleProcess.dbo.stage_dim_Customer
SET validTo = '12/31/1997'
WHERE CustomerID IN 
(SELECT CustomerID
FROM OrderSaleProcess.dbo.Customer_changed)

-- Insert the entries from the table with changed values and set the proper validfrom and validto
INSERT INTO OrderSaleProcess.dbo.stage_dim_Customer
(CustomerID,
Country,
validFrom,
validTo
)
SELECT CustomerID, Country,'01/01/1998','12/31/9999'
FROM OrderSaleProcess.dbo.Customer_changed
go 
DROP TABLE OrderSaleProcess.dbo.Customer_changed


---Insert the finded added rows
USE northwindDB
go
INSERT INTO OrderSaleProcess.dbo.stage_dim_Customer
(CustomerID,
Country,
validFrom,
validTo
)
--find the added rows
SELECT CustomerID, Country,'01/01/1998','12/31/9999'
FROM Customers
WHERE CustomerID IN 
((
---Getting the entries for today in the NorthwindDB
SELECT CustomerID
FROM Customers
)
EXCEPT 
(
---Getting the entries for yesterday in OrderSaleProcess
SELECT CustomerID
FROM OrderSaleProcess.dbo.Customer
))


