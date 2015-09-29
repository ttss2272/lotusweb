USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveSupplierPayment_USP]    Script Date: 09/29/2015 18:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SaveSupplierPayment_USP] 	
(
	@PurchaseTransactionID int,
	@PaidAmount float,
	@AmountPaidDate nvarchar(50),
	@UpdatedByUserID int,
	@PaymentReceiptNo nvarchar(MAX),
	@BalanceAmount float
)
AS
DECLARE @TransactionTotal float= 0
DECLARE @msg nvarchar(50)
--DECLARE @BalanceAmount float=0
BEGIN
--if(@SaleTransactionID<>'')
 -- Begin
	insert into SupplierPayment (PurchaseTransactionID,PaidAmount,AmountPaidDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate, PaymentReceiptNo)
				values (@PurchaseTransactionID,@PaidAmount,convert(date,@AmountPaidDate,103),@UpdatedByUserID,@UpdatedByUserID,convert(datetime,GETDATE()),convert(datetime,GETDATE()),@PaymentReceiptNo)
	         --  BEGIN--if row affected 14
			---		SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=23)
			--		SELECT @msg
			--	END			
			set	@TransactionTotal=( select BalanceAmount from PurchaseTransaction where PurchaseTransactionID=@PurchaseTransactionID)
			--set @BalanceAmount = @TransactionTotal-@PaidAmount
				exec UpdateBalanceAmountPurchase_USP 0,@BalanceAmount,@PurchaseTransactionID,@UpdatedByUserID
END
