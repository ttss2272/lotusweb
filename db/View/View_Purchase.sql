/****** Object:  View [dbo].[View_Purchase]    Script Date: 10/09/2015 14:53:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Created by:- PriTesh D .Sortee
-- purpose:- Purchase View for Get warehosue stock
ALTER VIEW [dbo].[View_Purchase]
AS
SELECT     dbo.Product.ProductID, dbo.Product.ProductName, dbo.Warehouse.WarehouseID, dbo.Warehouse.WarehouseName, CONVERT(DECIMAL(18,2),SUM(dbo.PurchaseTransactionDetail.Quantity)) AS 'PurchaseQuantity'
FROM		dbo.PurchaseTransactionDetail INNER JOIN
			dbo.Product  ON dbo.PurchaseTransactionDetail.ProductID  =dbo.Product.ProductID INNER JOIN 
			dbo.PurchaseTransaction ON dbo.PurchaseTransactionDetail.PurchaseTransactionID = dbo.PurchaseTransaction.PurchaseTransactionID INNER JOIN
			dbo.Warehouse ON dbo.Warehouse.WarehouseID= dbo.PurchaseTransaction.WarehouseID 
			
GROUP BY dbo.Product.ProductID, dbo.Product.ProductName, dbo.Warehouse.WarehouseID, dbo.Warehouse.WarehouseName


                       
GO


