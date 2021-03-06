/****** Object:  StoredProcedure [dbo].[UpdateBalanceAmountPurchase_USP]    Script Date: 10/10/2015 13:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 29/09/2015
-- Description:	Update Balance Amount for medical shop
-- =============================================
ALTER PROCEDURE [dbo].[UpdateBalanceAmountPurchase_USP] 
	@DiscountAmount float,
	@BalanceAmount float,
	@PurchaseTansactionID float,
	@UpdatedByUserID int
AS
BEGIN
if (@PurchaseTansactionID<>0)
	BEGIN
		if (@DiscountAmount=0)
			BEGIN
				update PurchaseTransaction set BalanceAmount= @BalanceAmount, UpdatedByUserID=@UpdatedByUserID,UpdatedDate=GETDATE()
				where PurchaseTransactionID=@PurchaseTansactionID
			END
		else
			BEGIN
				update PurchaseTransaction set BalanceAmount= @BalanceAmount, UpdatedByUserID=@UpdatedByUserID,UpdatedDate=GETDATE()
				where PurchaseTransactionID=@PurchaseTansactionID
			END
	END
	
END
