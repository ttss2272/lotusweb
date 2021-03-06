/****** Object:  StoredProcedure [dbo].[SaveTempPurchaseDetail_USP]    Script Date: 09/29/2015 17:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D .Sortee
-- Create date: 29 Sept 2015
-- Description:	Save Purchase Product Details in Temp Table
-- =============================================
ALTER PROCEDURE [dbo].[SaveTempPurchaseDetail_USP] 
	(
	@ProductID int,
	@PurchaseRate decimal(18,2),
	@SaleRate decimal(18,2),
	@Quantity decimal(18,2),
	@BatchNo nvarchar(MAX),
	@ExpiryDate nvarchar(MAX),
	@PurchaseTransactionID int
	)
AS
DECLARE @tempQty decimal(18,2)
BEGIN
	IF  EXISTS (Select * from Temp_Purchase WHERE PurchaseTransactionID=@PurchaseTransactionID AND ProductID=@ProductID)--Check for transaction ID That Product Available or not
		BEGIN
			IF EXISTS (Select * from Temp_Purchase WHERE PurchaseTransactionID=@PurchaseTransactionID AND ProductID=@ProductID AND BatchNo=@BatchNo)--Check for transaction ID That Product and batch no Available or not
				BEGIN--IF Batch No Is Same
					SET @tempqty=(Select Quantity from Temp_Purchase WHERE PurchaseTransactionID=@PurchaseTransactionID AND ProductID=@ProductID AND BatchNo=@BatchNo)--Get Quantity for that batch no of product for that TransactionID
					SET @Quantity=@tempQty+@Quantity
					Update Temp_Purchase set Quantity= @Quantity 
					 WHERE PurchaseTransactionID=@PurchaseTransactionID AND ProductID=@ProductID AND BatchNo=@BatchNo
				END
			ELSE--If Batch no is diffrent  for that Same product and transaction id
				BEGIN
					INSERT INTO Temp_Purchase (ProductID,PurchaseRate,SaleRate,Quantity,BatchNo,ExpiryDate,PurchaseTransactionID)
					VALUES (@ProductID,@PurchaseRate,@SaleRate,@Quantity,@BatchNo,CONVERT(datetime,@ExpiryDate,103),@PurchaseTransactionID)
				END
			
		END
	ELSE
		BEGIN--for perticular transaction id product is not available enter product
		INSERT INTO Temp_Purchase (ProductID,PurchaseRate,SaleRate,Quantity,BatchNo,ExpiryDate,PurchaseTransactionID)
			VALUES (@ProductID,@PurchaseRate,@SaleRate,@Quantity,@BatchNo,CONVERT(datetime,@ExpiryDate,103),@PurchaseTransactionID)
		END
END
