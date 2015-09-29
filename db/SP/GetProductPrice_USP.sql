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
-- Create date: 29 Sept 2015
-- Description:	Get Product Price
-- =============================================
ALTER PROCEDURE GetProductPrice_USP 
	(
	@ProductID int
	)
AS
BEGIN
	SELECT coalesce(PurchasePrice,0) AS PurchasePrice,coalesce(SallingPrice,0) AS SallingPrice FROM Product
	WHERE ProductID LIKE CASE WHEN @ProductID<>0 THEN @ProductID ELSE CONVERT(nvarchar(50),ProductID)END
END
GO
