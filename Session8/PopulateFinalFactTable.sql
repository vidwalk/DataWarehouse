USE [OrderSaleProcess]
GO

INSERT INTO [dbo].[F_Order]
           ([P_ID]
           ,[E_ID]
           ,[DateID]
           ,[C_ID]
           ,[Quantity]
           ,[SalesAmount]
           ,[Discount])
	SELECT
	[P_ID]
    ,[E_ID]
    ,[D_ID]
    ,[C_ID]
    ,[Quantity]
    ,[SalesAmount]
    ,[Discount]

	FROM temp_fact_order
	