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
-- Create date: 09 Oct 2015
-- Description:	get Warehouse product List
-- =============================================
ALTER PROCEDURE GetWarehouseProduct_USP 
	(
	@WarehouseID int
	)
AS
BEGIN
	SELECT DISTINCT pr.ProductID,pr.ProductName FROM Product pr
	INNER JOIN PurchaseTransactionDetail ptd
	ON ptd.ProductID = pr.ProductID
	
	INNER JOIN PurchaseTransaction pt
	ON pt.PurchaseTransactionID =ptd.PurchaseTransactionID
	WHERE pt.WarehouseID LIKE CASE WHEN @WarehouseID <>0 THEN @WarehouseID ELSE CONVERT(NVARCHAR(50),pt.WarehouseID) END
	Group BY pr.ProductID,pr.ProductName
	ORDER BY pr.ProductName
END
GO
