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
-- Author:		PriTesh D .Sortee
-- Create date: 29 Sept 2015
-- Description:	Save Purchase Product Details in Temp Table
-- =============================================
CREATE PROCEDURE Usp_SaveTempPurchaseDetail 
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
					VALUES (@ProductID,@PurchaseRate,@SaleRate,@Quantity,@BatchNo,@ExpiryDate,@PurchaseTransactionID)
				END
			
		END
	ELSE
		BEGIN--for perticular transaction id product is not available enter product
		INSERT INTO Temp_Purchase (ProductID,PurchaseRate,SaleRate,Quantity,BatchNo,ExpiryDate,PurchaseTransactionID)
			VALUES (@ProductID,@PurchaseRate,@SaleRate,@Quantity,@BatchNo,@ExpiryDate,@PurchaseTransactionID)
		END
END
GO
