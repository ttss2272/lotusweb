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
-- Create date: 25 Sept 2015
-- Description:	Get Perticular Product Stock detail
-- =============================================
CREATE PROCEDURE GetMedicalProduct_USP 
	(
	@MedicalShopID int,
	@ProductID int
	)
AS
BEGIN
	SELECT Stock,convert(nvarchar(50),StockEntryDate,103) FROM MedicalStock
	WHERE MedicalShopID LIKE CASE WHEN @MedicalShopID <>0 THEN @MedicalShopID ELSE CONVERT(nvarchar(50),MedicalShopID) END
	AND ProductID LIKE CASE WHEN @ProductID<>0 THEN @ProductID ELSE CONVERT (nvarchar(50),ProductID) END
END
GO
