/****** Object:  StoredProcedure [dbo].[SaveSupplierPayment_USP]    Script Date: 10/08/2015 18:25:47 ******/
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
	@BalanceAmount float,
	@Comment NVARCHAR (MAX)
)
AS
DECLARE @TransactionTotal float= 0
DECLARE @msg nvarchar(50)
--DECLARE @BalanceAmount float=0
DECLARE @Output nvarchar(50)
DECLARE @no nvarchar(50)
Declare @TempPaymentReceiptNo nvarchar(50)
BEGIN
SET @PaymentReceiptNo=LTRIM(RTRIM(@PaymentReceiptNo))
SET @Comment=LTRIM(RTRIM(@Comment))

--if(@SaleTransactionID<>'')
 -- Begin
 SET @no = (SELECT  COUNT(*) FROM SupplierPayment)
 SET @no= @no+1
 SET @PaymentReceiptNo= 'Sup Pay 00'+@no
 SET @PaymentReceiptNo =LTRIM(RTRIM(@PaymentReceiptNo))
 
	insert into SupplierPayment (PurchaseTransactionID,PaidAmount,AmountPaidDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate, PaymentReceiptNo,Comment)
				values (@PurchaseTransactionID,@PaidAmount,convert(date,@AmountPaidDate,103),@UpdatedByUserID,@UpdatedByUserID,convert(datetime,GETDATE()),convert(datetime,GETDATE()),@PaymentReceiptNo,@Comment)
	         --  BEGIN--if row affected 14
			---		SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=23)
			--		SELECT @msg
			--	END			
			set	@TransactionTotal=( select BalanceAmount from PurchaseTransaction where PurchaseTransactionID=@PurchaseTransactionID)
			--set @BalanceAmount = @TransactionTotal-@PaidAmount
				exec UpdateBalanceAmountPurchase_USP 0,@BalanceAmount,@PurchaseTransactionID,@UpdatedByUserID
END
