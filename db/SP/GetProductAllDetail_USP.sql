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
-- Create date: 28 Sept 2015
-- Description:	Get Product's All Detail to Bind GridView and Form Details
-- =============================================
Alter PROCEDURE GetProductAllDetail_USP 
(	
@ProductTypeID int,
@ProductID int
)
AS
BEGIN
	SELECT pr.ProductID,pr.ProductName,pr.ProductCode,prtype.ProductTypeID,prtype.ProductTypeName,PurchasePrice,SallingPrice
	From Product pr
	INNER JOIN ProductType prtype
	ON prtype.ProductTypeID=pr.ProductTypeID
	
	WHERE prtype.ProductTypeID LIKE CASE WHEN @ProductTypeID <>0 THEN @ProductTypeID ELSE CONVERT(NVARCHAR(50),prtype.ProductTypeID)END
	AND pr.ProductID LIKE CASE WHEN @ProductID <>0 THEN @ProductID ELSE CONVERT (NVARCHAR(50), pr.ProductID)END
	AND pr.IsActive=1
	
	ORDER BY ProductName ASC
END
GO
