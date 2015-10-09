-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 09 OCT 2015
-- Description:	Get Product and Its Stock on warehouse ID
-- =============================================
CREATE PROCEDURE GetWarehouseProductStock_USP 
	(
	@WarehouseID int = 0 
	)
AS
BEGIN
	SELECT vp.ProductID,  vp.ProductName, vp.WarehouseID , vp.WarehouseName, vp.PurchaseQuantity ,  coalesce( vs.SaleQuantity,0) as 'SaleQuantity' ,coalesce( vsr.SaleReturnQuantity,0) as 'SalesReturnQuantity' , (COALESCE( vp.PurchaseQuantity,0) - COALESCE(vs.SaleQuantity,0) + COALESCE( vsr.SaleReturnQuantity,0)) as 'Stock' from 
		View_Purchase as vp
		LEFT JOIN View_Sale as vs on vp.ProductID = vs.ProductID and vp.warehouseid = vs.WarehouseID 
		LEFT JOIN View_SalesReturn as vsr on vp.ProductID=vsr.ProductID and vp.warehouseID=vsr.WarehouseID

		WHERE vp.WarehouseID =@WarehouseID
		
		ORDER BY ProductName

END
GO
