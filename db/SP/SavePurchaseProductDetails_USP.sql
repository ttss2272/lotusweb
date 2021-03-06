/****** Object:  StoredProcedure [dbo].[SavePurchaseProductDetails_USP]    Script Date: 10/08/2015 10:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 06 Oct 2015
-- Description:	Create Purchase product save button Coding
-- =============================================
ALTER PROCEDURE [dbo].[SavePurchaseProductDetails_USP] 
	(
		@PurchaseTransactionID int
	)
AS
DECLARE @msg nvarchar(MAX)
DECLARE @RowCnt int
BEGIN

SET @RowCnt = (SELECT Count(*) FROM Temp_Purchase WHERE PurchaseTransactionID=@PurchaseTransactionID)

-- Set purchase Price And saling price of product in product Table

UPDATE Product
SET Product.PurchasePrice=tmp.PurchaseRate,Product.SallingPrice=tmp.SaleRate
FROM Temp_Purchase tmp
WHERE Product.ProductID=tmp.ProductID AND tmp.PurchaseTransactionID=@PurchaseTransactionID



	INSERT INTO PurchaseTransactionDetail (PurchaseTransactionID,ProductID,Quantity,PurchaseRate,BatchNo,ExpiryDate)
	SELECT PurchaseTransactionID,ProductID,Quantity,PurchaseRate,BatchNo,ExpiryDate
	FROM Temp_Purchase WHERE PurchaseTransactionID=@PurchaseTransactionID
	
	IF (@@ROWCOUNT=@RowCnt)
		BEGIN
		--SET BALANCE Amount OF Purchase Product
		  UPDATE PurchaseTransaction SET BalanceAmount =(SELECT SUM(t.Quantity* t.PurchaseRate) FROM Temp_Purchase t WHERE t.PurchaseTransactionID=@PurchaseTransactionID )
		  WHERE PurchaseTransactionID=@PurchaseTransactionID
		  
		   DELETE FROM Temp_Purchase where PurchaseTransactionID=@PurchaseTransactionID
			SET @msg= (SELECT [Message] FROM [Message] WHERE MessageID=42) -- Message NO42 'Purchase Transaction Saved Sucessfully...!!!'
			SELECT @msg
			
		END
	ELSE
		BEGIN
		
			SET @msg= (SELECT [Message] FROM [Message] WHERE MessageID=43) --Message No 43'Purchase Transaction Not Saved Sucessfully.'
			SELECT @msg
			
		END
		
	
END
