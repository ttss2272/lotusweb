
/****** Object:  StoredProcedure [dbo].[UpdateBalanceAmount_USP]    Script Date: 09/29/2015 14:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 29/09/2015
-- Description:	Update Discount Amount and Balance Amount for medical shop
-- =============================================
create PROCEDURE [dbo].[UpdateBalanceAmount_USP] 
	@DiscountAmount float,
	@BalanceAmount float,
	@SaleTansactionID float,
	@UpdatedByUserID int
AS
BEGIN
if (@SaleTansactionID<>0)
	BEGIN
		if (@DiscountAmount=0)
			BEGIN
				update SaleTransaction set BalanceAmount= @BalanceAmount, UpdatedByUserID=@UpdatedByUserID,UpdatedDate=GETDATE()
				where SaleTransactionID=@SaleTansactionID
			END
		else
			BEGIN
				update SaleTransaction set BalanceAmount= @BalanceAmount,DiscountAmount=@DiscountAmount, UpdatedByUserID=@UpdatedByUserID,UpdatedDate=GETDATE()
				where SaleTransactionID=@SaleTansactionID
			END
	END
	
END
