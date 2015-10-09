/****** Object:  View [dbo].[VIEW_SalesReturn]    Script Date: 10/09/2015 14:55:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Created By: PriTesh D. Sortee
-- Purpose : View for sale return quantity
-- Date : 09 Oct 2015

ALTER VIEW [dbo].[VIEW_SalesReturn]
AS
SELECT     dbo.Product.ProductID, dbo.Product.ProductName, dbo.Warehouse.WarehouseID, dbo.Warehouse.WarehouseName, 
			CONVERT(DECIMAL(18,2),SUM(dbo.SalesReturnDetail.Quantity)) AS 'SaleReturnQuantity'
FROM         dbo.Product INNER JOIN
                      dbo.SalesReturnDetail ON dbo.Product.ProductID = dbo.SalesReturnDetail.ProductID INNER JOIN
                      dbo.SalesReturn ON dbo.SalesReturnDetail.SalesReturnID = dbo.SalesReturn.SalesReturnID INNER JOIN
                      dbo.Warehouse ON dbo.SalesReturn.WarehouseID = dbo.Warehouse.WarehouseID

GROUP BY dbo.Product.ProductID, dbo.Product.ProductName, dbo.Warehouse.WarehouseID, dbo.Warehouse.WarehouseName                      
GO


