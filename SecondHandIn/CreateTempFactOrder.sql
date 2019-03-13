
CREATE TABLE OrderSaleProcess.dbo.temp_fact_order (
	C_ID int NULL,
	E_ID int NULL,
	P_ID int NULL,
	D_ID int NULL,
	SH_ID int NULL,
	SP_ID int NULL,
	CustomerID nchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductID int NULL,
	EmployeeID int NULL,
	OrderDate datetime NULL,
	ShipperID int NULL,
	SupplierID int NULL,
	Quantity smallint NULL,
	SalesAmount money NULL,
	Discount real NULL
) GO;
