/****** Object:  View [dbo].[View_Sale]    Script Date: 10/09/2015 14:54:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Created By:- PriTesh D. Sortee
-- Created Date :- 09 Oct 2015
-- Purpose :- Get Sale quantity of product in Warehosue

ALTER VIEW [dbo].[View_Sale]
AS

SELECT     dbo.Product.ProductID, dbo.Product.ProductName, dbo.SaleTransaction.WarehouseID,dbo.Warehouse.WarehouseName,CONVERT(DECIMAL(18,2), SUM(dbo.SaleTransactionDetail.Quantity)) AS 'SaleQuantity'
                      
FROM        dbo.Product INNER JOIN
                    dbo.SaleTransactionDetail ON dbo.Product.ProductID = dbo.SaleTransactionDetail.ProductID INNER JOIN 
					dbo.SaleTransaction ON  dbo.SaleTransactionDetail.SaleTransactionID= dbo.SaleTransaction.SaleTransactionID INNER JOIN
					dbo.Warehouse ON  dbo.SaleTransaction.WarehouseID = dbo.Warehouse.WarehouseID
					
GROUP BY dbo.Product.ProductID, dbo.Product.ProductName, dbo.Warehouse.WarehouseName,dbo.SaleTransaction.WarehouseID





  
                      
GO


