/****** Object:  StoredProcedure [dbo].[GetTempPurchaseDetail_USP]    Script Date: 09/29/2015 17:31:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 29 Sept 2015
-- Description:	Get Temp detail for sale transaction id
-- =============================================
ALTER PROCEDURE [dbo].[GetTempPurchaseDetail_USP] 
	(
	@PurchaseTransactionID int
	)
AS
BEGIN
	SELECT pr.ProductName,tmp.PurchaseRate,tmp.SaleRate,tmp.Quantity,tmp.BatchNo,CONVERT(nvarchar(50),tmp.ExpiryDate,103) From Temp_Purchase tmp
	
	INNER JOIN Product pr
	ON pr.ProductID=tmp.ProductID
	
	WHERE tmp.PurchaseTransactionID LIKE CASE WHEN @PurchaseTransactionID <>0 THEN @PurchaseTransactionID ELSE CONVERT (nvarchar(50),tmp.PurchaseTransactionID)END
END
