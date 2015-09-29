USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveMedicalShopPayment_USP]    Script Date: 09/29/2015 17:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SaveMedicalShopPayment_USP] 	
(
	@SaleTransactionID int,
	@PaidAmount float,
	@AmountPaidDate nvarchar(50),
	@UpdatedByUserID int,
	@MedicalPaymentNo nvarchar(MAX),
	@BalanceAmount float
)
AS
DECLARE @TransactionTotal float= 0
DECLARE @msg nvarchar(50)
--DECLARE @BalanceAmount float=0
BEGIN
--if(@SaleTransactionID<>'')
 -- Begin
	insert into MedicalPayment (SaleTransactionID,PaidAmount,AmountPaidDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate, MedicalPaymentNo)
				values (@SaleTransactionID,@PaidAmount,convert(date,@AmountPaidDate,103),@UpdatedByUserID,@UpdatedByUserID,convert(datetime,GETDATE()),convert(datetime,GETDATE()),@MedicalPaymentNo)
	         --  BEGIN--if row affected 14
			---		SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=23)
			--		SELECT @msg
			--	END			
			set	@TransactionTotal=( select BalanceAmount from SaleTransaction where SaleTransactionID=@SaleTransactionID)
			--set @BalanceAmount = @TransactionTotal-@PaidAmount
				exec UpdateBalanceAmount_USP 0,@BalanceAmount,@SaleTransactionID,@UpdatedByUserID
END
