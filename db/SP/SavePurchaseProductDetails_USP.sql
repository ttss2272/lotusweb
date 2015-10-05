/****** Object:  StoredProcedure [dbo].[SavePurchaseProductDetails_Usp]    Script Date: 10/05/2015 16:30:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 05 Oct 2015
-- Description:	Save Purchase Product Details
-- =============================================
CREATE PROCEDURE [dbo].[SavePurchaseProductDetails_USP] 
	(
		@PurchaseTransactionID int
	)
AS
DECLARE @msg nvarchar(MAX)
DECLARE @RowCnt int
BEGIN

SET @RowCnt = (SELECT Count(*) FROM PurchaseTransaction WHERE PurchaseTransactionID=@purchaseTransactionID)
-- Set purchase Price And saling price of product in product Table

UPDATE Product
SET Product.PurchasePrice=tmp.PurchaseRate,Product.SallingPrice=tmp.SaleRate
FROM Temp_Purchase tmp
WHERE Product.ProductID=tmp.ProductID AND tmp.PurchaseTransactionID=PurchaseTransactionID



	INSERT INTO PurchaseTransactionDetail (PurchaseTransactionID,ProductID,Quantity,PurchaseRate,BatchNo,ExpiryDate)
	SELECT PurchaseTransactionID,ProductID,Quantity,PurchaseRate,BatchNo,ExpiryDate
	FROM Temp_Purchase WHERE PurchaseTransactionID=@PurchaseTransactionID
	
	IF (@@ROWCOUNT=@RowCnt)
		BEGIN
			SET @msg= 'Purchase Transaction Saved Sucessfully...!!!'
			SELECT @msg
		END
	ELSE
		BEGIN
			SET @msg= 'Purchase Transaction Not Saved Sucessfully'
			SELECT @msg
		END
END
