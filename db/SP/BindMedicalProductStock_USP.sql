/****** Object:  StoredProcedure [dbo].[BindMedicalProductStock_USP]    Script Date: 10/10/2015 15:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 25 Sept 2015
-- Description:	get product detail on medical shop ID to bind GridView
-- =============================================
ALTER PROCEDURE [dbo].[BindMedicalProductStock_USP] 
	(
	@MedicalShopID int
	)
AS
BEGIN
	SELECT pr.ProductName,medstock.Stock,CONVERT(DATE,medstock.StockEntryDate,103) AS 'StockEntryDate',medstock.MedicalStockID,medstock.ProductID from MedicalStock medstock
	
	INNER JOIN Product pr
	on pr.ProductID =medstock.ProductID
	
	where medstock.MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT(nvarchar(50), medstock.MedicalShopID) END
END
