UPDATE [temp_fact_order]
SET C_ID = (SELECT C_ID from Customer WHERE Customer.CustomerID = temp_fact_order.CustomerID)
UPDATE [temp_fact_order]
SET E_ID = (SELECT E_ID from Employee WHERE Employee.EmployeeID = temp_fact_order.EmployeeID)
UPDATE [temp_fact_order]
SET P_ID = (SELECT P_ID from Product WHERE Product.ProductID = temp_fact_order.ProductID)
UPDATE [temp_fact_order]
SET D_ID = (SELECT DateID from Calendar WHERE Calendar.CalendarDate = temp_fact_order.OrderDate)
UPDATE [temp_fact_order]
SET SH_ID = (SELECT SH_ID from Shipper WHERE Shipper.ShipperID = temp_fact_order.ShipperID)
UPDATE [temp_fact_order]
SET SP_ID = (SELECT SP_ID from Supplier WHERE Supplier.SupplierID = temp_fact_order.SupplierID)
