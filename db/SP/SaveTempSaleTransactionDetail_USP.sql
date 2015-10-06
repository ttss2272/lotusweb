/****** Object:  StoredProcedure [dbo].[SaveTempSaleTransactionDetail_USP]    Script Date: 06/10/2015 10:15:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 06 Oct 2015
-- Description:	Save Sale Transaction Product Details in Temp Table
-- =============================================
Create PROCEDURE [dbo].[SaveTempSaleTransactionDetail_USP] 
	(
	@ProductID int,
	@SalePrice decimal(18,2),
	@Quantity decimal(18,2),
	@DiscountAmount decimal(18,2),
	@SaleTransactionID int
	)
AS
DECLARE @tempQty decimal(18,2)
BEGIN
	IF  EXISTS (Select * from Temp_Sale WHERE SaleTransactionID=@SaleTransactionID AND ProductID=@ProductID)--Check for transaction ID That Product Available or not
		BEGIN
			IF EXISTS (Select * from Temp_Sale WHERE SaleTransactionID=@SaleTransactionID AND ProductID=@ProductID)--Check for transaction ID That Product Available or not
				BEGIN--IF Batch No Is Same
					SET @tempqty=(Select Quantity from Temp_Sale WHERE SaleTransactionID=@SaleTransactionID AND ProductID=@ProductID)--Get Quantity for that product for that TransactionID
					SET @Quantity=@tempQty+@Quantity
					Update Temp_Sale set Quantity= @Quantity 
					 WHERE SaleTransactionID=@SaleTransactionID AND ProductID=@ProductID
				END
			ELSE--If  product diffrent and transaction id
				BEGIN
					INSERT INTO Temp_Sale (ProductID,SalePrice,Quantity,SaleTransactionID)
					VALUES (@ProductID,@SalePrice,@Quantity,@SaleTransactionID)
				END
			
		END
	ELSE
		BEGIN--for particular transaction id product is not available enter product
		INSERT INTO Temp_Sale (ProductID,SalePrice,Quantity,SaleTransactionID)
			VALUES (@ProductID,@SalePrice,@Quantity,@SaleTransactionID)
		END
END
