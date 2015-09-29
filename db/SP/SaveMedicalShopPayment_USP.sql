
/****** Object:  StoredProcedure [dbo].[Usp_SaveMedicalShopPayment]    Script Date: 09/29/2015 14:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SaveMedicalShopPayment_USP] 	
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
--DECLARE @BalanceAmount float=0
BEGIN
	insert into MedicalPayment (SaleTransactionID,PaidAmount,AmountPaidDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate, MedicalPaymentNo)
				values (@SaleTransactionID,@PaidAmount,convert(date,@AmountPaidDate,103),@UpdatedByUserID,@UpdatedByUserID,convert(datetime,GETDATE()),convert(datetime,GETDATE()),@MedicalPaymentNo)
				
			set	@TransactionTotal=( select BalanceAmount from SaleTransaction where SaleTransactionID=@SaleTransactionID)
			--set @BalanceAmount = @TransactionTotal-@PaidAmount
				exec UpdateBalanceAmount_USP 0,@BalanceAmount,@SaleTransactionID,@UpdatedByUserID
END
